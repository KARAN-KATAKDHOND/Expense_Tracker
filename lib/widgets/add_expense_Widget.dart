import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    //last date = now
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    //.then((value)); alternate method
    print(pickedDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  // var _enteredTitle = '';
  // void _saveTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }

  //onSubmit
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = (enteredAmount == null || enteredAmount < 0);

    if ((_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null)) {
      //show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input!!'),
          content: const Text(
            "Please Make Sure a Valid title,amount,date and category was entered.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    //.....
    widget.onAddExpense(
      Expense(
        amount: enteredAmount,
        title: _titleController.text,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          const SizedBox(height: 20),
          //Amount TextField and Date Picker Row
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    prefixText: '₹ ',
                    label: Text('Amount'),
                  ),
                ), //sets prefix ₹
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.>\d{0,2}')),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(_selectedDate!),
                    ), //!added to force dart that selected DAte wont be null anytime
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ), //transform type from enum to DropDownItem
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save Expense'),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text(
                  'Cancel',
                ),
                icon: const Icon(Icons.cancel, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
