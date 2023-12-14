import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateFormate = DateFormat.yMd();

enum Category { food, travel, clothes, beauty, treatment }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.clothes: Icons.person,
  Category.beauty: Icons.face,
  Category.treatment: Icons.local_pharmacy,
};

class ExpensesModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  /// use date formatter as getter to call him direct
  String get formattedDate {
    return dateFormate.format(date);
  }

  ExpensesModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}

class ExpenseBucket {
  final Category category;
  final List<ExpensesModel> expenses;

  ExpenseBucket(this.category, this.expenses);
  
  ExpenseBucket.forCategory(
    List<ExpensesModel> allExpenses,
    this.category,
  ) : expenses = allExpenses.where((ele) => ele.category == category).toList();

  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
