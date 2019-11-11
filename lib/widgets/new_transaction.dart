import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransactionHandler;

  NewTransaction(this.addNewTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text);

    if(title.isEmpty || amount <= 0){
      return;
    }

    widget.addNewTransactionHandler(
      title,
      amount
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              //onChanged: (value) => titleInput = value,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              //onChanged: (value) => amountInput = value,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: submitData,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
