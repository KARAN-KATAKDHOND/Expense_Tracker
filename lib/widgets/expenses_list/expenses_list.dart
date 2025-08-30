//Listing the Expense Item Cards
import 'package:expense_tracker/widgets/expenses_list/expense_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';
//code for list of Expense Cards
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItemWidget(expenses[index]),//mapping all elements[expense] of expense list to 
                                                                      //this ExpenseItemWidget 
    );
  }
}
