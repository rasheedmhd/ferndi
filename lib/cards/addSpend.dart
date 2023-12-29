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
                  decoration: const InputDecoration(
                    label: Text("What did you buy?"),
                    isDense: true,
                  ),
                ),
                TextField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    label: Text("Notes"),
                    isDense: true,
                  ),
                ),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefix: Text("GHS "),
                      label: Text("Amount"),
                      isDense: true),
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
                const SizedBox(
                  height: 40,
                ),
                FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    label: const Text(
                      "          record          ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                    onPressed: () {
                      if (int.parse(_amountController.text) >
                          _selectedWallet.balance) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255, 255, 231, 241),
                          content: Column(
                            children: [
                              Text(
                                "You don't have enough money in the Wallet",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71)),
                              ),
                              Text(
                                "Go to Accounts and add money first.",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71)),
                              ),
                            ],
                          ),
                        ));
                      } else {
                        recordSpend(Spend(
                            ObjectId(),
                            _nameController.text,
                            _notesController.text,
                            int.parse(_amountController.text),
                            DateTime.now()));
                        // print(_selectedWallet.balance - int.parse(_amountController.text));
                        _nameController.clear();
                        _notesController.clear();
                        _amountController.clear();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255, 231, 255, 245),
                          content: Column(
                            children: [
                              Text(
                                "You have successfully record you Spend. Yay!",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 9, 163, 99)),
                              ),
                            ],
                          ),
                        ));
                      }
                    }),
              ],
            )));
  }
}
