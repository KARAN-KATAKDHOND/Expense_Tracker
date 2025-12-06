import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/models/expense_model.dart';

class ExpenseNotifier extends Notifier<List<Expense>>{
  @override
  List<Expense> build(){
    return [];
  }

  void onaddExpense(Expense expense){
    state = [...state,expense];
  }

  void onRemoveExpense(Expense expense){
    state = state.where((e)=>e.id!=expense.id).toList();

  }
  void insertExpense(int index,Expense expense){
    final newState = [...state];
    newState.insert(index, expense);
    state = newState;
  }
}
final expensesProvider = NotifierProvider<ExpenseNotifier, List<Expense>>(() {
  return ExpenseNotifier();
});

final totalExpenseProvider = Provider<double> ((ref){
  final expenses = ref.watch(expensesProvider);
  double sum = 0;
  for (final expense in expenses){
    sum+= expense.amount;
  }
  return sum;
});
