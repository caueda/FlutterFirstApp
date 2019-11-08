import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context)  {
    return Container(
      height: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(child: Row(children: <Widget>[
              Container(
                child: Text(
                  '\$ ${transactions[index].amount}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                padding: EdgeInsets.all(10),
              )
              ,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactions[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(transactions[index].date),
                    style: TextStyle(
                      color: Colors.grey,

                    ),
                  )
                ],)
            ],)
            );
          },
          itemCount: transactions.length,
        )
    )
    ;
  }

}