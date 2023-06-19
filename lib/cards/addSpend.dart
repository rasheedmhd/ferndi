import "package:flutter/material.dart";

class AddSpendCard extends StatefulWidget {
  const AddSpendCard({super.key});

  @override
  AddSpendCardState createState() => AddSpendCardState();
}

class AddSpendCardState extends State<AddSpendCard> {
  // LEGACY
  // List<String> spendInfo = [];

  // void _saveSpendInfo(String info) {
  //   spendInfo.add(info);
  // }
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration:
                      const InputDecoration(label: Text("What did you buy?")),
                ),
                TextField(
                  controller: _notesController,
                  maxLength: 250,
                  decoration: const InputDecoration(label: Text("Notes")),
                ),
                TextField(
                  controller: _amountController,
                  maxLength: 5, // redundant check
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(prefix: Text("GHS "), label: Text("Amount")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text("Cancel")
                    ), 
                    ElevatedButton(
                        onPressed: () {
                          print(_titleController.text);
                          print(_notesController.text);
                          print(_amountController.text);
                        },
                        child: const Text("Record")
                    )
                  ],
                )
              ],
            )));
  }
}
