import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 243, 247, 2));
void main() {
  runApp(
    MaterialApp(

      theme: ThemeData().copyWith(
        //scaffoldBackgroundColor: Color(const Color.fromARGB(221, 0, 0, 0))
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
        //backgroundColor: Colors.white ,
        ),

        cardTheme: const CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
        ))

      ),
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    )
  );
}
