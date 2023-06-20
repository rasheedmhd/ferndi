import "package:app/models/subscription.dart";
import "package:app/models/wallets.dart";
import "package:flutter/material.dart";

class AddSubscriptionCard extends StatefulWidget {
  const AddSubscriptionCard({super.key});

  @override
  AddSubscriptionCardState createState() => AddSubscriptionCardState();
}

class AddSubscriptionCardState extends State<AddSubscriptionCard> {

  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  Duration _selectedDuration = Duration.Month;
  Wallet _selectedWallet = Wallet.Cash;

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
                    const Spacer(),
                    DropdownButton(
                      value: _selectedDuration,
                      items: Duration.values
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
                        print(_nameController.text);
                        print(_amountController.text);
                      },
                      child: const Text("Record")
                    )
                  ],
                )
              ],
            )));
  }
}
