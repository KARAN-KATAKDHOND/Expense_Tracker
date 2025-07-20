import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
    const Expenses({super.key});

    @override
    State<Expenses> createState(){
        return _ExpenseState();
    }
}
class _ExpenseState extends State<Expenses>{
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
            children: const [
                Text('The Chart'),
                Text('Expense List....'),
            ],
          )
        ),
      ),
    );
    }
}