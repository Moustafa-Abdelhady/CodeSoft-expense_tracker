import 'package:expense_tracker_ui/widgets/expanses_list/expanses_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker_ui/model/expenses_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<ExpensesModel> expenses;
  final void Function(ExpensesModel expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
              background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(.7),
                  margin: Theme.of(context).cardTheme.margin),
              key: ValueKey(expenses[index]),
              onDismissed: (direction) => onRemoveExpense(expenses[index]),
              child: ExpensesItem(expense: expenses[index]));
        });
  }
}
