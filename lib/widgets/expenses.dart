import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item_widget.dart';
import 'package:expense_tracker/widgets/add_expense_Widget.dart';
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
  });
}

void _removeExpense(Expense expense){
//done to find index of deleted expense for recovery purpose
final expenseIndex = _registeredExpenses.indexOf(expense);

  setState(() {
    _registeredExpenses.remove(expense);
  });
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text('$expense.title deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIndex,expense);
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
            child: Text('Expense Tracker', textAlign: TextAlign.center),
          ),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // const Color.fromARGB(255, 34, 155, 254),
                // const Color.fromARGB(255, 110, 161, 249),
                Color(0xFF121212),
                Color(0xFF121212),
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
              //Toolbar with the add button => Row()
              Text('The Chart'),
              Expanded(child: mainContent),
            ],
          ),
        ),
      );
  }
}
