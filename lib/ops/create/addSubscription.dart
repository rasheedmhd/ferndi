import 'package:app/models/schemas.dart';
import "package:app/utility/schema/methods.dart";
import 'package:app/models/schemas.dart' as subscription;
import "package:flutter/material.dart";
import "package:realm/realm.dart";
import "package:app/providers/subs_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:flutter/services.dart';
import "package:intl/intl.dart";

import "package:font_awesome_flutter/font_awesome_flutter.dart";



class AddSubscriptionCard extends ConsumerStatefulWidget {
  const AddSubscriptionCard({super.key});

  @override
  AddSubscriptionCardState createState() => AddSubscriptionCardState();
}

class AddSubscriptionCardState extends ConsumerState<AddSubscriptionCard> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  Duration _selectedDuration =
   duration.isEmpty ? Duration(ObjectId(), "Month", DateTime.now()) : duration.first;
  

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
        _dateController.text =
            DateFormat("EEEE, dd MMMM, yyyy").format(setDate);
      });
    } else {
      date = DateTime.now();
    }
  }

  void newDate(String typedDate) {
    date = DateTime.parse(typedDate);
  }

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: ' Today');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Wallet selectedWallet = 
      wallets.isEmpty ? Wallet(ObjectId(), "Flexible", 0, DateTime.now()) : wallets.first;

  @override
  Widget build(BuildContext context) {

      
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Subscription"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 227, 226, 226),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50), // Limit the number of characters
                ],
                decoration: const InputDecoration(
                  label: Text("Name"),
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),
              TextField(
                controller: _amountController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10), // Limit the number of characters
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true, 
                  prefix: Text("GHS "), 
                  label: Text("Amount"),
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),
              TextField(
                controller: _dateController,
                onChanged: newDate,
                readOnly: true,
                decoration: const InputDecoration(
                  iconColor: Color.fromARGB(255, 151, 151, 151),
                  icon: FaIcon(
                    FontAwesomeIcons.calendarDay,
                    size: 24,
                  ),
                  border: InputBorder.none,
                  label: Text("Charge Date"),
                  isDense: true,
                  
                ),
                onTap: () {
                  setDatePicker();
                },
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),  
              const SizedBox(
                height: 20,
              ),                          
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 227, 226, 226),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedWallet,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.wallet,
                        size: 30,
                        color: Color.fromARGB(255, 17, 221, 163),
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
                            selectedWallet = value;
                          },
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 227, 226, 226),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: DropdownButton(
                      underline: Container(),
                      value: _selectedDuration,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      icon: const Icon(
                        Icons.timer,
                        size: 30,
                        color: Color.fromARGB(255, 146, 2, 93),
                      ),
                      items: duration
                          .map(
                            (duration) => DropdownMenuItem(
                              value: duration,
                              child: Text(duration.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(
                          () {
                            _selectedDuration = value;
                          },
                        );
                      },
                    ),
                  )
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
                  "          record          ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                onPressed: () {
                  if (_nameController.text.isEmpty ||
                      _amountController.text.isEmpty ||
                      _selectedDuration.name.isEmpty ||
                      selectedWallet.name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromARGB(255, 255, 231, 241),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Subscription details incomplete",
                              style: TextStyle(
                                color: Color.fromARGB(255, 163, 9, 71),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Please add a name, amount, wallet and duration.",
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
                  ref.watch(subscriptionsNotifier.notifier).addSubscription(
                        subscription.Subscription(
                          ObjectId(),
                          _nameController.text,
                          double.tryParse(_amountController.text) ?? 0,
                          wallet: selectedWallet,
                          duration: _selectedDuration,
                          // CreatedAt
                          DateTime.now(),
                          // ChargeAt
                          DateFormat("EEEE, dd MMMM, yyyy")
                              .tryParse(_dateController.text) ??
                          DateTime.now(),
                        ),
                      );
                  _nameController.clear();
                  _amountController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 231, 255, 245),
                      content: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Subscription successfully recorded your. yay! ",
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
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
