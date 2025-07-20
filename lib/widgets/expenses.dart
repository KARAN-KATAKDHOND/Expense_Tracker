import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item_widget.dart';
class Expenses extends StatefulWidget {
    const Expenses({super.key});

    @override
    State<Expenses> createState(){
        return _ExpenseState();
    }
}
class _ExpenseState extends State<Expenses>{
    
    final List<Expense> _registeredExpenses = [
        Expense(amount: 19.99,
        title: 'Flutter Course', 
        date: DateTime.now(), 
        category: Category.work,
        ),
        Expense(
        amount: 22.22 ,
        title: 'Mangrove Cleaning Auto Fare',
        date: DateTime.now(),
        category: Category.travel,
    ),
    Expense(
      amount: 349.00,
      title: 'JetBrains Student License',
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      amount: 85.50,
      title: 'Tea & Sandwich Meetup with Juniors',
      date: DateTime.now(),
      category: Category.food,
    ),
    ];
    
    @override 
    Widget build (BuildContext context){
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 34, 155, 254), const Color.fromARGB(255, 110, 161, 249)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
                Text('The Chart'),
                Expanded(child: ExpensesList(expenses: _registeredExpenses)),
            ],
          )
        ),
      ),
    );
    }
}