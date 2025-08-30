//Listing the Expense Item Cards
import 'package:expense_tracker/widgets/expenses_list/expense_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';
//code for list of Expense Cards
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) =>Dismissible(
        key: ValueKey(expenses[index]),
         child: ExpenseItemWidget(expenses[index]),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
      ),//mapping all elements[expense] of expense list to 
                                                                      //this ExpenseItemWidget 
    );
  }
}
