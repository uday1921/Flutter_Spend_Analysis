import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './new_Transaction.dart';
import './transaction_list.dart';
import '../main.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;

  // ignore: prefer_const_constructors_in_immutables
  TransactionList(this.transactions);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  void _delete(String index1) {
    setState(() {
      // ignore: list_remove_unrelated_types, unrelated_type_equality_checks
      widget.transactions.removeWhere((item) => item.id == index1.toString());
    });
  }

  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      height: 300,
      child: widget.transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions added yet",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    elevation: 5.0,
                    // ignore: avoid_print
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin:
                                // ignore: prefer_const_constructors
                                EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              '\u{20B9}${widget.transactions[index].amount.toStringAsFixed(2)}',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                          ),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  widget.transactions[index].title.toString(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMMEEEEd()
                                    .format(widget.transactions[index].date),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.0,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Container(
                            // ignorealig: prefer_const_constructors
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.only(left: 50),
                              child: IconButton(
                                onPressed: () {
                                  _delete(widget.transactions[0].id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
              itemCount: widget.transactions.length,
            ),
    );
  }
}
