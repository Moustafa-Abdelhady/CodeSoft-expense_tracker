import 'package:expense_tracker_ui/widgets/expanses_list/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

  var myColorScheme = ColorScheme.fromSeed(seedColor:
  const Color.fromARGB(255, 59, 96, 179)
  );

  var myDarkColorScheme = ColorScheme.fromSeed(seedColor:
  const Color.fromARGB(255, 59, 96, 179)
  );

 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracker',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
          useMaterial3:true,
        colorScheme:myColorScheme,
        appBarTheme:const AppBarTheme().copyWith(
          backgroundColor:myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ) ,
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.secondaryContainer.withOpacity(.8),
          margin: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
        ),
        elevatedButtonTheme:ElevatedButtonThemeData(style:ElevatedButton.styleFrom(
          backgroundColor: myColorScheme.primaryContainer
        ) ) ,
        textTheme:ThemeData().textTheme.copyWith(
          titleLarge:TextStyle(
            fontWeight: FontWeight.bold,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 20
          ),
           bodyMedium:TextStyle(
            fontWeight: FontWeight.bold,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 15
          ),
          bodySmall:TextStyle(
            fontWeight: FontWeight.bold,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 13
          ),
        )
       
      ),
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3:true,
        colorScheme:myDarkColorScheme,
        bottomSheetTheme:const BottomSheetThemeData().copyWith(
          backgroundColor: myDarkColorScheme.onPrimaryContainer,
        ),
        appBarTheme:const AppBarTheme().copyWith(
          backgroundColor:myDarkColorScheme.onPrimaryContainer,
          foregroundColor: myDarkColorScheme.primaryContainer,
        ) ,
        cardTheme: const CardTheme().copyWith(
          color: myDarkColorScheme.secondaryContainer.withOpacity(.8),
          margin: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
        ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
          backgroundColor: myDarkColorScheme.onPrimaryContainer,
          foregroundColor: myDarkColorScheme.primaryContainer,
        ) ) ,
        textTheme:ThemeData().textTheme.copyWith(
          titleLarge:TextStyle(
            fontWeight: FontWeight.bold,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 20
          ),
           bodyMedium:TextStyle(
            fontWeight: FontWeight.bold,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 15
          ),
          bodySmall:TextStyle(
            fontWeight: FontWeight.bold,
            color: myDarkColorScheme .onSecondaryContainer,
            fontSize: 13
          ),
        )
       
      ),
      home:const Expenses(),
    );
  }
}





// class Expense {
//   final String description;
//   final double amount;
//   final DateTime date;
//   final String category;

//   Expense({required this.description, required this.amount, required this.date, required this.category});
// }

// // Dummy expense data
// List<Expense> expenses = [
//   Expense(description: ),
//   Expense(description: 'Gas', amount: 30.0, date: DateTime.now(), category: 'Travel'),
//   // Add more dummy expenses
// ];

// // Example of UI implementation using StatelessWidget
// class ExpenseListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Expense Tracker')),
//       body: ListView.builder(
//         itemCount: expenses.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(expenses[index].description),
//             subtitle: Text('${expenses[index].amount} - ${expenses[index].category}'),
//             // Display other expense details here
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navigate to the Add Expense screen
//           // Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpenseScreen()));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }