import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class EditSpendCard extends StatefulWidget {

  final Spend spend;
  // const EditSpendCard({required this.spend, super.key});
  const EditSpendCard(this.spend, {super.key});

  @override
  EditSpendCardState createState() => EditSpendCardState();
}

class EditSpendCardState extends State<EditSpendCard> {

  late Spend spendToEdit = getSpend(widget.spend.id);

  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _amountController = TextEditingController();
  
  // [[ TO DO ]] see linear issue on creating spends without wallet & categories
  late Category _selectedCategory = spendToEdit.category ??= categories.first;
  late Wallet _selectedWallet = spendToEdit.wallet ??= wallets.first;

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      iconColor: const Color.fromARGB(255, 151, 151, 151),
                      icon: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      label: const Text("What did spend on ?"),
                      hintText: "${spendToEdit.name}",
                      isDense: true,
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  TextField(
                    controller: _notesController,
                    decoration: InputDecoration(
                      iconColor: const Color.fromARGB(255, 151, 151, 151),
                      icon: const FaIcon(
                        FontAwesomeIcons.noteSticky,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      label: const Text("Notes"),
                      hintText: "${spendToEdit.notes}",
                      isDense: true,
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        iconColor: const Color.fromARGB(255, 151, 151, 151),
                        icon: const FaIcon(
                          FontAwesomeIcons.tags,
                          size: 24,
                        ),
                        border: InputBorder.none,
                        prefix: const Text("GHS "),
                        label: const Text("Amount"),
                        hintText: "${spendToEdit.amount}",
                        isDense: true),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  DropdownButton(
                    value: _selectedCategory,
                    hint: const Text("Category"),
                    icon: const FaIcon(
                      FontAwesomeIcons.boxArchive,
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
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
                    hint: const Text("Wallet"),
                    icon: const Icon(
                      Icons.wallet_sharp,
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
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
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      label: const Text(
                        "          save          ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      foregroundColor: const Color.fromARGB(255, 5, 61, 135),
                      backgroundColor: const Color.fromARGB(255, 35, 206, 135),
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
                                  "Go to Accounts and top up first.",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 163, 9, 71)),
                                ),
                              ],
                            ),
                          ));
                        } else {
                          updateSpend(Spend(
                              spendToEdit.id,
                              _nameController.text,
                              _notesController.text,
                              int.parse(_amountController.text),
                              category: _selectedCategory,
                              wallet: _selectedWallet,
                              DateTime.now()));
                          // print(_selectedWallet.balance - int.parse(_amountController.text));
                          _nameController.clear();
                          _notesController.clear();
                          _amountController.clear();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Color.fromARGB(255, 231, 255, 245),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Spend edited and Saved successfully. ",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 9, 163, 99)),
                                    ),
                                    Icon(Icons.sentiment_very_satisfied,
                                        color: Color.fromARGB(255, 9, 163, 9))
                                  ],
                                ),
                              ],
                            ),
                          ));
                        }
                      }),
                ],
              ))),
    );
  }
}








class MyRecord extends StatefulWidget {
  final String recordName;
  const MyRecord(this.recordName, {super.key});

  @override
  MyRecordState createState() => MyRecordState();
}

class MyRecordState extends State<MyRecord> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.recordName); // Here you direct access using widget
  }
}