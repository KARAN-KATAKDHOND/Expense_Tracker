import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item_widget.dart';
import 'package:expense_tracker/widgets/add_expense_Widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker/widgets/expenses_list/wallet.dart';
var sum = 0.00;
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    // Expense(
    //   amount: 19.99,
    //   title: 'Flutter Course',
    //   date: DateTime.now(),
    //   category: Category.work,
    // ),
    // Expense(
    //   amount: 22.22,
    //   title: 'Mangrove Cleaning Auto Fare',
    //   date: DateTime.now(),
    //   category: Category.travel,
    // ),
    // Expense(
    //   amount: 349.00,
    //   title: 'JetBrains Student License',
    //   date: DateTime.now(),
    //   category: Category.work,
    // ),
    // Expense(
    //   amount: 85.50,
    //   title: 'Tea & Sandwich Meetup with Juniors',
    //   date: DateTime.now(),
    //   category: Category.food,
    // ),
  ];
//
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense,),
    );
  }
void _addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add(expense);
    // _registeredExpenses.forEach((expense){
    //   sum+= expense.amount;
    // });
    sum+=expense.amount;
    sum = (sum * 100).round() / 100;
  });
}

void _removeExpense(Expense expense){
//done to find index of deleted expense for recovery purpose
final expenseIndex = _registeredExpenses.indexOf(expense);

  setState(() {
    _registeredExpenses.remove(expense);
    sum = sum - expense.amount;
    sum = (sum * 100).round() / 100;
  });
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 4),
      content: Text('${expense.title} {₹ ${expense.amount} } deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIndex,expense);
            sum += expense.amount;
          });
        },
      )
      ),
  );
}

  @override
  Widget build(BuildContext context) {

Widget mainContent = const Center(
  child: Text(
    'No Expenses Found!! , Start adding some!',
    style: TextStyle(
      color: Colors.green,
    ),
    ),);

  if(_registeredExpenses.isNotEmpty){
    mainContent = ExpensesList(expenses: _registeredExpenses,onRemoveExpense: _removeExpense,);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Wallet(sum: sum,),
              //Toolbar with the add button => Row()
              Chart(expenses: _registeredExpenses),
              // Text('The Chart'),
              Expanded(child: mainContent),
            ],
          ),
        ),
      );
  }
}
