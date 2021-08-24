// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(
    this.addtx,
  );

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitdata() {
    final enteredtitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredtitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addtx(
      enteredtitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitdata(),
              decoration: InputDecoration(
                labelText: 'Title',
                border: UnderlineInputBorder(),
                hintText: 'Enter Title of Your Expense',
              ),
              /*onChanged: (value) => {
                        titleInput = value,
                      }*/
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitdata(),
              controller: amountController,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Cost of your Expense'),
            ),
            ElevatedButton(
              child: Text("Add Transaction"),
              onPressed: submitdata,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
