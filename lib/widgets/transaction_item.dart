import 'package:first_app/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {

final Transaction transaction;
  final Function deleteTx;

  const TransactionItem ({
    Key key,
    @required this.transaction,
    @required this.deleteTx
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
        elevation: 6,
        child: ListTile(
          title: Text(
            "${transaction.title}",
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(
              "${DateFormat.yMMMd().format(transaction.date)}"),
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text("\$${transaction.amount}"),
              ),
            ),
          ),
          trailing: mediaQuery.size.width > 360 ?
          FlatButton.icon(
              onPressed: () => deleteTx(transaction.id),
              icon: Icon(Icons.delete),
              textColor: Theme.of(context).errorColor,
              label: Text("Delete"))
              :IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () => deleteTx(transaction.id),
          ),
        )
    );
  }

}