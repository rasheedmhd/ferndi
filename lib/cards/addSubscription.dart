import 'package:app/models/schemas.dart';
import 'package:app/models/schemas.dart' as subscription;
import "package:flutter/material.dart";
// import "package:flutter/material.dart";
import "package:realm/realm.dart";

class AddSubscriptionCard extends StatefulWidget {
  const AddSubscriptionCard({super.key});

  @override
  AddSubscriptionCardState createState() => AddSubscriptionCardState();
}

class AddSubscriptionCardState extends State<AddSubscriptionCard> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  Duration _selectedDuration = duration.first;
  Wallet _selectedWallet = wallets.first;
  // Duration _selectedDuration = Duration.Month;
  // Wallet _selectedWallet = Wallet.AccessDebitCard;

  @override
  void dispose() {
    _nameController.dispose();
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
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Add Subscription",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                //   const Align(
                //   alignment: Alignment.topLeft,
                //   child: Text(
                //     "Add",
                //     style: TextStyle(
                //       fontSize: 52.0,
                //       color: Color.fromARGB(255, 5, 61, 135),
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                //   const Align(
                //   alignment: Alignment.topLeft,
                //   child: Text(
                //     "Subscription",
                //     style: TextStyle(
                //       fontSize: 52.0,
                //       color: Color.fromARGB(255, 5, 61, 135),
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                TextField(
                  controller: _nameController,
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text("Name")),
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
                      value: _selectedWallet,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      icon: const Icon(Icons.wallet),
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
                          print(_selectedWallet);
                        });
                      },
                    ),
                    const Spacer(),
                    DropdownButton(
                      value: _selectedDuration,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      icon: const Icon(Icons.timelapse),
                      items: duration
                          .map((duration) => DropdownMenuItem(
                                value: duration,
                                child: Text(duration.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedDuration = value;
                          print(_selectedDuration);
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
                          addSubscription(subscription.Subscription(
                              ObjectId(),
                              _nameController.text,
                              _amountController.text,
                              wallet: _selectedWallet,
                              duration: _selectedDuration,
                              DateTime.now()));
                          _nameController.text = "";
                          _amountController.text = "";                         
                        },
                        child: const Text("Record"))
                  ],
                )
              ],
            )));
  }
}
