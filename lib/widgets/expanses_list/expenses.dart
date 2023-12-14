import 'package:expense_tracker_ui/model/expenses_model.dart';
import 'package:expense_tracker_ui/widgets/expanses_list/expenses_list.dart';
import 'package:expense_tracker_ui/widgets/expanses_list/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../chart/cart.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

  @override
  State<Expenses> createState() => _ExpensesState();
}

final List<ExpensesModel> _expenses = [
  ExpensesModel(
      title: 'Fruits',
      amount: 30,
      date: DateTime.now(),
      category: Category.food),
  ExpensesModel(
      title: 'Gas',
      amount: 99.99,
      date: DateTime.now(),
      category: Category.travel),
  ExpensesModel(
      title: 'T-shirt',
      amount: 54.99,
      date: DateTime.now(),
      category: Category.clothes),
  ExpensesModel(
      title: 'Treatment for headache',
      amount: 23,
      date: DateTime.now(),
      category: Category.treatment),
];

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expenses Tracker',
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (e) => NewExpenses(onAddExpense: _addExpense));
                setState(() {});                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
              },                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
              icon: const Icon(Icons.add))                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(         
          image: DecorationImage(
            image: AssetImage(
                'assets/images/lovely_space_kitten-wallpaper-1366x768.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(expenses: _expenses,),
            Expanded(child: ExpensesList(expenses: _expenses,onRemoveExpense:_removeExpense)),
          ],
        ),
      ),
    );
  }

  void _addExpense(ExpensesModel expenses) {
    setState(() {
      _expenses.add(expenses);
    });
  }


  void _removeExpense(ExpensesModel expenses) {
    setState(() {
      _expenses.remove(expenses);
    });
  }
}
