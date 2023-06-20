import "package:app/models/spend.dart";
import "package:app/models/wallets.dart";
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
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.Food;
  Wallet _selectedWallet = Wallet.Cash;

  @override
  void dispose() {
    _nameController.dispose();
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
                  controller: _nameController,
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text("name")),
                ),
                TextField(
                  controller: _amountController,
                  maxLength: 5,
                  decoration: const InputDecoration(label: Text("amount")),
                ),
                TextField(
                  controller: _amountController,
                  maxLength: 5, // redundant check
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefix: Text("GHS "), label: Text("Amount")),
                ),
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                          print(_selectedCategory);
                        });
                      },
                    ),
                    const Spacer(),
                    DropdownButton(
                      value: _selectedWallet, //const Text("Select Wallet"),
                      items: Wallet.values
                          .map((wallet) => DropdownMenuItem(
                                value: wallet,
                                child: Text(wallet.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedWallet = value;
                          print(_selectedWallet);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          print(_nameController.text);
                          print(_notesController.text);
                          print(_amountController.text);
                        },
                        child: const Text("Record"))
                  ],
                )
              ],
            )));
  }
}
