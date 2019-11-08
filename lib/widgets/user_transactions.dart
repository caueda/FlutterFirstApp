import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'new_transaction.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransactions> {
  List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final tx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
