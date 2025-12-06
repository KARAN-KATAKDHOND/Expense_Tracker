import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item_widget.dart';
import 'package:expense_tracker/widgets/add_expense_Widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker/widgets/expenses_list/wallet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class Expenses extends ConsumerStatefulWidget {
  const Expenses({super.key});

  @override
  ConsumerState<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends ConsumerState<Expenses> {

//
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => NewExpense(),
    );
  }


void _removeExpense(Expense expense){
//done to find index of deleted expense for recovery purpose
final expenseIndex = ref.read(expensesProvider).indexOf(expense);

  
    ref.read(expensesProvider.notifier).onRemoveExpense(expense);
 
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 4),
      content: Text('${expense.title} {₹ ${expense.amount} } deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: (){
          ref.read(expensesProvider.notifier).insertExpense(expenseIndex, expense);

        },
      )
      ),
  );
}

  @override
  Widget build(BuildContext context) {
final width = MediaQuery.of(context).size.width;
// print(MediaQuery.of(context).size.height);


final expenses = ref.watch(expensesProvider);
final sum  = ref.watch(totalExpenseProvider);
Widget mainContent = const Center(
  child: Text(
    'No Expenses Found!! , Start adding some!',
    style: TextStyle(
      color: Colors.green,
    ),
    ),);

  if(expenses.isNotEmpty){
    mainContent = ExpensesList(expenses: expenses,onRemoveExpense: _removeExpense,);
  }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2ECC71),

          // Colors.blueGrey,
          title: Center(
            child: Text('Expense Tracker',
            textAlign: TextAlign.center,
            style: GoogleFonts.anton(
              color: Colors.white,
              fontSize: 30,
              
            ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // const Color.fromARGB(255, 34, 155, 254),
                // const Color.fromARGB(255, 110, 161, 249),
                // Color(0xFF121212),
                // Color(0xFF121212),
                //charcoal fade
                Color(0xFF434343), // Dark Charcoal
              Color(0xFF000000)
              //midnight blue
              // Color(0xFF0f2027), // Dark Slate Blue
              // Color(0xFF203a43), // Medium Dark Blue
              // Color(0xFF2c5364), 
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: width<600 ?Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Wallet(),
              //Toolbar with the add button => Row()
              Chart(expenses: expenses),
              // Text('The Chart'),
              Expanded(child: mainContent),
            ],
          ) : Row(
            children: [
              
                  Expanded(
                      child:Wallet(),
                      ),
                      //Toolbar with the add button => Row()
                      Expanded(
                        child: Chart(expenses: expenses),
                      ),
                  // Text('The Chart'),
                  Expanded(child: mainContent),
                ],
          )
        ),
      );
  }
}
