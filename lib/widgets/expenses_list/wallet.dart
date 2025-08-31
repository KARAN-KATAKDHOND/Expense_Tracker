import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  // CORRECTED: Added the 'double' type to the 'sum' variable.
  const Wallet({super.key, required this.sum});
  final double sum;

  @override
  State<Wallet> createState() {
    return _WalletState();
  }
}

// CORRECTED: Used 'extends' instead of 'return' for the class definition.
class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
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
                    text: widget.sum.toString(), // The amount
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
