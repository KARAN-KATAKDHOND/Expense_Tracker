//Individual Expense Item Card
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';

class ExpenseItemWidget extends StatelessWidget {
  const ExpenseItemWidget(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1E1E1E),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title,style: TextStyle(
              color: Color.fromARGB(255, 79, 247, 2),
            ),),
            const SizedBox(height:4),
            Row(
              children: [
                Text('₹ ${expense.amount}',style: TextStyle(
              color: Color(0xFF888888),
            ),),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    Text(expense.formattedDate,
                      style: TextStyle(color: Color(0xFF888888)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )
      );
  }
}
