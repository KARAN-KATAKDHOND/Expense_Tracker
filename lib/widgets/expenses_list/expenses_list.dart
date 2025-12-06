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
        background: Container(
          // 1. Use the theme's error color for consistency (it's usually red).
          // 2. Add .withOpacity() for the transparency effect.
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),

          // 3. Add an icon and align it to the right.
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.delete, color: Colors.white, size: 30),
        ),
        child: ExpenseItemWidget(expenses[index]),
        
        //Theme.of(context).colorScheme.error,),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
      ),//mapping all elements[expense] of expense list to 
                                                                      //this ExpenseItemWidget 
    );
  }
}
