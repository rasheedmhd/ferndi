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
      appBar: AppBar(
        title: const Text("Add Subscription"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              padding: const EdgeInsets.all(20),
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
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text("Name"),
                      isDense: true,
                    ),
                  ),
                  TextField(
                    controller: _amountController,
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      isDense: true,
                      prefix: Text("GHS "), 
                      label: Text("Amount")
                    ),
                  ),
                  const SizedBox( height: 10,),
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
                          value: _selectedWallet,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          icon: const Icon(
                            Icons.wallet_sharp,
                            size: 30,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        icon: const Icon(
                          Icons.av_timer,
                          size: 30,
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
                  )],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  FloatingActionButton.extended(
                    elevation: 1,
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
                      if (_nameController.text.isEmpty ||
                          _amountController.text.isEmpty ||
                          _selectedDuration.name.isEmpty ||
                          _selectedWallet.name.isEmpty) {
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
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                                Icon(Icons.sentiment_very_satisfied,
                                    color: Color.fromARGB(255, 9, 163, 9))
                              ],
                            ),
                          ],
                        ),
                      ));
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ))),
    );
  }
}
