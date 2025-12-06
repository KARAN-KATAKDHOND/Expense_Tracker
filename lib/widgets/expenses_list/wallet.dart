import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wallet extends ConsumerWidget {
  const Wallet({super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final sum = ref.watch(totalExpenseProvider);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      // 1. A deep, matte grey instead of pure black
      color: Color(0xFF1C1C1E),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.4),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Expense',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 12),

            // 2. Using Text.rich to style the currency symbol differently
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '₹ ', // Currency Symbol
                    style: TextStyle(
                      color: Colors.greenAccent, // Vibrant accent color
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: sum.toString(), // The amount
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
// CORRECTED: Added the missing closing brace for the build method and the class.
}
