import 'dart:developer';
import 'package:expense_tracker_ui/widgets/expanses_list/expenses.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_ui/model/expenses_model.dart';
import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddExpense});

  final void Function(ExpensesModel expense) onAddExpense;

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final formater = DateFormat.yMd();
  Category _selectedCategory = Category.food;

  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 60,
            decoration: InputDecoration(
                label: const Text('Title'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(
                    label: const Text('amount'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    prefixText: '\$',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Selected'
                        : formater.format(_selectedDate!)),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =
                            DateTime(now.year - 1, now.month, now.day);
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: firstDate,
                          lastDate: now,
                        );
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                            child: Text(e.name.toUpperCase()), value: e),
                      )
                      .toList(),
                  onChanged: (selectedCat) {
                    if (selectedCat == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = selectedCat;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final double? enteredAmount =
                      double.tryParse(_amountController.text);
                  final bool amountIsValide =
                      enteredAmount == null || enteredAmount <= 0;

                  if (_titleController.text.trim().isEmpty ||
                      amountIsValide ||
                      _selectedDate == null) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Invalid Input'),
                        content: const Text(
                            'Please make sure valid title , amount, date and category was entered'),
                        icon: const Icon(Icons.error),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: const Text('okay'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    print('onAdd');
                    widget.onAddExpense(
                      ExpensesModel(
                          title: _titleController.text,
                          amount: enteredAmount,
                          date: _selectedDate!,
                          category: _selectedCategory),
                    );

                    Navigator.pop(context);
                    print(_titleController.text);
                    print(enteredAmount);
                    print(_selectedDate);
                    print(_selectedCategory);
                  }
                },
                child: const Text('Save Expense'),
              )
            ],
          )
        ],
      ),
    );
  }
}
