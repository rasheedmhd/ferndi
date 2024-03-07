import "package:app/models/schemas.dart";
import "package:app/providers/spends_provider.dart";
import 'package:app/providers/wallets_provider.dart' as P;
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:realm/realm.dart";
import "package:intl/intl.dart";

class AddSpendCard extends ConsumerStatefulWidget {
  const AddSpendCard({super.key});

  @override
  AddSpendCardState createState() => AddSpendCardState();
}

class AddSpendCardState extends ConsumerState<AddSpendCard> {
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = categories.isEmpty
      ? Category(ObjectId(), "Miscellaneous", "💞", "", DateTime.now())
      : categories.first;
  Wallet _selectedWallet =
      wallets.isEmpty ? Wallet(ObjectId(), "Flexible", 0, DateTime.now()) : wallets.first;

  late int newBalance =
      _selectedWallet.balance - int.parse(_amountController.text);

  DateTime date = DateTime.now();

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
      appBar: AppBar(
        title: const Text("Record Spend"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 227, 226, 226),
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      iconColor: Color.fromARGB(255, 151, 151, 151),
                      icon: FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      label: Text("What did spend on?"),
                      isDense: true,
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  TextField(
                    controller: _notesController,
                    decoration: const InputDecoration(
                      iconColor: Color.fromARGB(255, 151, 151, 151),
                      icon: FaIcon(
                        FontAwesomeIcons.noteSticky,
                        size: 24,
                      ),
                      border: InputBorder.none,
                      label: Text("Notes"),
                      isDense: true,
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        iconColor: Color.fromARGB(255, 151, 151, 151),
                        icon: FaIcon(
                          FontAwesomeIcons.tags,
                          size: 24,
                        ),
                        border: InputBorder.none,
                        prefix: Text("GHS "),
                        label: Text("Amount"),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: DropdownButton(
                      value: _selectedWallet,
                      hint: const Text("Wallet"),
                      icon: const Icon(
                        Icons.wallet_sharp,
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
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
                  FloatingActionButton.extended(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    label: const Text(
                      "          record          ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color.fromARGB(255, 35, 206, 135),
                    onPressed: () {
                      if (_nameController.text.isEmpty ||
                          _amountController.text.isEmpty ||
                          _selectedCategory.name.isEmpty ||
                          _selectedWallet.name.isEmpty) {
                        ScaffoldMessenger.of(context).clearSnackBars();
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
                                        color: Color.fromARGB(255, 163, 9, 71),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                        return;
                      }
                      if (int.parse(_amountController.text) >
                          _selectedWallet.balance) {
                        ScaffoldMessenger.of(context).clearSnackBars();
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
                        return;
                      } else {
                        ref.read(spendsNotifier.notifier).recordSpend(
                              Spend(
                                ObjectId(),
                                _nameController.text,
                                _notesController.text,
                                int.parse(_amountController.text),
                                category: _selectedCategory,
                                wallet: _selectedWallet,
                                date,
                              ),
                            );
                        ref.read(P.walletsNotifier.notifier).updateWallet(
                          Wallet(
                            _selectedWallet.id, 
                            _selectedWallet.name,
                            newBalance, 
                            DateTime.now()
                          ),     
                        );
                        _nameController.clear();
                        _notesController.clear();
                        _amountController.clear();
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color.fromARGB(255, 231, 255, 245),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You have successfully recorded your Spend. Yay! ",
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
        ],
      ),
    );
  }
}
