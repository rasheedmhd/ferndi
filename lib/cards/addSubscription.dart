import 'package:app/models/schemas.dart';
import "package:app/utility/schema/methods.dart";
import 'package:app/models/schemas.dart' as subscription;
import "package:flutter/material.dart";
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

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
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
            TextField(
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text("Name")),
            ),
            TextField(
              controller: _amountController,
              maxLength: 5,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  prefix: Text("GHS "), label: Text("Amount")),
            ),
            Row(
              children: [
                DropdownButton(
                  value: _selectedWallet,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  icon: const Icon(
                    Icons.wallet_sharp,
                    size: 20,
                    color: Color.fromARGB(255, 17, 221, 163),
                  ),
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
                const Spacer(),
                DropdownButton(
                  value: _selectedDuration,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  icon: const Icon(
                    Icons.av_timer,
                    size: 20,
                    color: Color.fromARGB(255, 146, 2, 93),
                  ),
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
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                    label: const Icon(Icons.close),
                  backgroundColor: const Color.fromARGB(255, 255, 231, 241),
                  foregroundColor: const Color.fromARGB(255, 163, 9, 71),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
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
                    if (_nameController.text.isEmpty || _amountController.text.isEmpty || _selectedDuration.name.isEmpty || _selectedWallet.name.isEmpty ) {
                      ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                        backgroundColor: Color.fromARGB(255, 255, 231, 241),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Subscription details incomplete",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 163, 9, 71)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Please add a name, amount, wallet and duration.",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 163, 9, 71)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                      return;
                    } 
                    addSubscription(subscription.Subscription(
                      ObjectId(),
                      _nameController.text,
                      int.tryParse(_amountController.text) ?? 0,
                      wallet: _selectedWallet,
                      duration: _selectedDuration,
                      DateTime.now()));
                    _nameController.clear();
                    _amountController.clear();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      backgroundColor: Color.fromARGB(255, 231, 255, 245),
                      content: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Subscription successfully recorded your. yay! ",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 9, 163, 99)),
                              ),
                              Icon(Icons.sentiment_very_satisfied, color: Color.fromARGB(255, 9, 163, 9))                      
                            ],
                          ),
                        ],
                      ),
                    ));                    
                  },
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
