import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredAmount<=0 || enteredTitle.isEmpty)  {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) =>  submitData,
        // onChanged: (val) => amountInput = val,
      ),
              // onChanged: (val) {
              //   titleInput = val;
              // }
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) =>
                  submitData, //this is convention when i don't need a argument that's not of use we put underscore to indicate that
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              onPressed: submitData,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.cyanAccent)),
              child: const Text("Add transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
