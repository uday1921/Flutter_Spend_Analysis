// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:spend_analysis/widgets/new_Transaction.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            )),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //late String titleInput;
  //late String amountInput;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransctions = [];
  int inc = 0;

  void _addTransaction(String txtitle, double txAmount) {
    // ignore: unused_local_variable
    final newTx = Transaction(
        id: inc.toString(),
        title: txtitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransctions.add(newTx);
      inc = inc + 1;
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  get child => null;

  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
              onPressed: () => {_startAddNewTransaction(context)},
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                // ignore: sized_box_for_whitespasce
                child: Container(width: 200, child: Text("Chart!")),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransctions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_startAddNewTransaction(context)},
        child: Icon(Icons.add),
      ),
    );

    return scaffold;
  }
}

class DateFormt {}
