import "package:app/models/schemas.dart";
import "package:app/providers/spends_provider.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class EditSpendCard extends ConsumerStatefulWidget {
  final Spend spend;
  const EditSpendCard(this.spend, {super.key});

  @override
  EditSpendCardState createState() => EditSpendCardState();
}

class EditSpendCardState extends ConsumerState<EditSpendCard> {
  late Spend spendToEdit = ref.watch(getSpend(widget.spend.id));

  late String name   = spendToEdit.name;
  late String notes  = spendToEdit.notes;
  late DateTime date = spendToEdit.createdAt;
  late String amount = spendToEdit.amount.toString();

  final _dateController = TextEditingController();
  // TextEditingController _dateController = TextEditingController();

  Future<void> setDatePicker() async {
    DateTime? setDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (setDate != null) {
      setState(() {
        _dateController.text = DateFormat("EEEE, dd MMMM, yyyy").format(setDate);
      });
    } else {
      date = DateTime.now();
    }
  }

  void _newName(String typedName) {
    name = typedName;
  }

  void _newNotes(String typedNotes) {
    notes = typedNotes;
  }

  void _newAmount(String typedAmount) {
    amount = typedAmount;
  }

  void newDate(String typedDate) {
    date = DateTime.parse(typedDate);
  }

  late Category _selectedCategory = spendToEdit.category ??= categories.first;
  late Wallet _selectedWallet = spendToEdit.wallet ??= wallets.first;
  
  
  // @override
  // void dispose() {
  //   _dateController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Spend"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 227, 226, 226),
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    initialValue: name,
                    onChanged: _newName,
                    decoration: InputDecoration(
                      iconColor: const Color.fromARGB(255, 151, 151, 151),
                      icon: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      label: const Text("You spent on"),
                      hintText: spendToEdit.name,
                      isDense: true,
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  TextFormField(
                    initialValue: notes,
                    onChanged: _newNotes,
                    decoration: InputDecoration(
                      iconColor: const Color.fromARGB(255, 151, 151, 151),
                      icon: const FaIcon(
                        FontAwesomeIcons.noteSticky,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      label: const Text("Notes"),
                      hintText: spendToEdit.notes,
                      isDense: true,
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  TextFormField(
                    initialValue: amount,
                    onChanged: _newAmount,
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
                  TextField(
                    controller: _dateController,
                    onChanged: newDate,
                    readOnly: true,
                    decoration:  InputDecoration(
                      iconColor: const Color.fromARGB(255, 151, 151, 151),
                      icon: const FaIcon(
                        FontAwesomeIcons.calendarDay,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      // label: Text("Date"),
                      label: Text(DateFormat("EEEE, dd MMMM, yyyy").format(date)),
                      isDense: true,
                    ),
                    onTap: () {
                      setDatePicker();
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),             
                  Row(
                    children: [
                      const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.boxArchive,
                            size: 24,
                            color: Color.fromARGB(255, 151, 151, 151),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Category:  ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 151, 151, 151),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: DropdownButton(
                          value: _selectedCategory,
                          hint: const Text("Category"),
                          underline: Container(),
                          isExpanded: true,
                          borderRadius: const BorderRadius.all(Radius.circular(20),
                      ),
                      items: categories
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(
                              () {
                                _selectedCategory = value;
                              },
                            );
                          },
                        ),    
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  Row(
                    children: [
                      const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.wallet,
                            size: 24,
                            color: Color.fromARGB(255, 151, 151, 151),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Wallet:  ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 151, 151, 151),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: DropdownButton(
                          value: _selectedWallet,
                          hint: const Text("Wallet"),
                          underline: Container(),
                          isExpanded: true,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          items: wallets
                              .map(
                                (wallet) => DropdownMenuItem(
                                  value: wallet,
                                  child: Text(wallet.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(
                              () {
                                _selectedWallet = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    label: const Text(
                      "          save          ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                    onPressed: () {
                      if (name.isEmpty ||
                          amount.isEmpty ||
                          _selectedCategory.name.isEmpty ||
                          _selectedWallet.name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color.fromARGB(255, 255, 231, 241),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Spend details incomplete",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Please add name, amount, wallet and category.",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 163, 9, 71)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                        return;
                      }
                      if (int.parse(amount) > _selectedWallet.balance) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color.fromARGB(255, 255, 231, 241),
                            content: Column(
                              children: [
                                Text(
                                  "You don't have enough money in the Wallet",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71),
                                  ),
                                ),
                                Text(
                                  "Go to Accounts and top up first.",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        ref.read(spendsNotifier.notifier).updateSpend(
                              Spend(
                                spendToEdit.id,
                                name,
                                notes,
                                int.parse(
                                  amount.toString(),
                                ),
                                category: _selectedCategory,
                                wallet: _selectedWallet,
                                DateFormat("EEEE, dd MMMM, yyyy")
                                    .tryParse(_dateController.text) ?? date,
                              ),
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
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
                                        color: Color.fromARGB(255, 9, 163, 99),
                                      ),
                                    ),
                                    Icon(
                                      Icons.sentiment_very_satisfied,
                                      color: Color.fromARGB(255, 9, 163, 9),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }
}
