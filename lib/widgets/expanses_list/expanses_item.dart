


import 'package:flutter/material.dart';

import 'package:expense_tracker_ui/model/expenses_model.dart';


class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final ExpensesModel expense;

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20 , vertical:16 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(expense.title,style:Theme.of(context).textTheme.bodyMedium),
                 
                  Icon(categoryIcon[expense.category]), 
              ],
            ),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(4)}',style:Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                Row(children: [
                 
                  Text(expense.formattedDate,style:Theme.of(context).textTheme.bodySmall),
                ],)
              ],
            )
            
          ],
        ),
      ),
    );
  }
}
