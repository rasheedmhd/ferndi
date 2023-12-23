import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:realm/realm.dart";

class AddSpendCard extends StatefulWidget {
  const AddSpendCard({super.key});

  @override
  AddSpendCardState createState() => AddSpendCardState();
}

class AddSpendCardState extends State<AddSpendCard> {
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = categories.first;
  Wallet _selectedWallet = wallets.first;

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
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                // maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("What did you buy?"),
                  isDense: true,
                ),
              ),
              TextField(
                controller: _notesController,
                // maxLength: 250,
                decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  label: Text("Notes"),
                  isDense: true,
                ),
              ),
              TextField(
                controller: _amountController,
                // maxLength: 5, // redundant check
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text("GHS "),
                  label: Text("Amount"),
                  isDense: true
                ),
              ),
              DropdownButton(
                value: _selectedCategory,
                icon: const FaIcon(FontAwesomeIcons.icons),
                isExpanded: true,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                items: categories
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
                  });
                },
              ),
              DropdownButton(
                value: _selectedWallet,
                icon: const Icon(Icons.wallet),
                isExpanded: true,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                items: wallets
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
                  });
                },
              ),
              // const SizedBox( height: 10,),
              const SizedBox(
                height: 40,
              ),

              FloatingActionButton.extended(
                label: const Text(
                  "          record          ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                // icon: const Icon(Icons.account_balance_wallet_sharp, size: 30.0),
                onPressed: () {
                  recordSpend(Spend(
                    ObjectId(),
                    _nameController.text,
                    _notesController.text,
                    _amountController.text,
                    category: _selectedCategory,
                    wallet: _selectedWallet,
                    DateTime.now()));
                    _nameController.text = "";
                    _notesController.text = "";
                    _amountController.text = "";
                  // if (_amountController.text  _selectedWallet.balance) {
                  //   print(
                  //       "POP UP: You are spending more money than you have, please top up your Wallet");
                  // } else {
                  //   recordSpend(Spend(
                  //       ObjectId(),
                  //       _nameController.text,
                  //       _notesController.text,
                  //       _amountController.text,
                  //       DateTime.now()));
                  //   _selectedWallet.balance - _amountController.text;
                  // }
                }
              ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // ElevatedButton(
                //     //   onPressed: () {}, child: const Text("Cancel")),
                //     ElevatedButton(
                //       onPressed: () {
                //         print(_nameController.text);
                //         print(_notesController.text);
                //         print(_amountController.text);
                //       },
                //       child: const Text("Record"))
                //   ],
                // )
              ],
            )));
  }
}
