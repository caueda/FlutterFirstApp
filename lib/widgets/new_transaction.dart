import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransactionHandler;

  NewTransaction(this.addNewTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              //onChanged: (value) => titleInput = value,
              decoration: InputDecoration(
                  labelText: 'Title'
              ),),
            TextField(
              controller: amountController,
              //onChanged: (value) => amountInput = value,
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () {
                addNewTransactionHandler(titleController.text, double.parse(amountController.text));
              },
              textColor: Colors.purple,
            )
          ],
        ),),
    );
  }
}
