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

  Future<void> setDatePicker() async {
    DateTime? setDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (setDate != null) {
      setState(() {
        date = setDate;
      });
    } else {
      date = DateTime.now();
    }
  }

  void newDate(String typedDate) {
    date = DateTime.parse(typedDate);
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

  late Category _selectedCategory = spendToEdit.category ??= categories.first;
  late Wallet _selectedWallet = spendToEdit.wallet ??= wallets.first;

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
                      label: const Text("What did spend on ?"),
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
                  TextFormField(
                    initialValue: DateFormat("EEEE, dd MMMM").format(date),
                    onChanged: newDate,
                    readOnly: true,
                    decoration: const InputDecoration(
                      iconColor: Color.fromARGB(255, 151, 151, 151),
                      icon: FaIcon(
                        FontAwesomeIcons.calendarDay,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      label: Text("Date"),
                      isDense: true,
                    ),
                    onTap: () {
                      setDatePicker();
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),             
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: DropdownButton(
                      value: _selectedCategory,
                      hint: const Text("Category"),
                      icon: const FaIcon(
                        FontAwesomeIcons.boxArchive,
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
                      isExpanded: true,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
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
                                date,
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
