import 'package:app/models/schemas.dart';
import "package:app/utility/schema/methods.dart";
import 'package:app/models/schemas.dart' as my;
import "package:flutter/material.dart";

class EditSubscriptionCard extends StatefulWidget {
  final my.Subscription subscription;
  const EditSubscriptionCard(this.subscription, {super.key});

  @override
  EditSubscriptionCardState createState() => EditSubscriptionCardState();
}

class EditSubscriptionCardState extends State<EditSubscriptionCard> {

  late my.Subscription subscriptionToEdit =
      getSubscription(widget.subscription.id);

  late String name = subscriptionToEdit.name;
  late String amount = subscriptionToEdit.amount.toString();

  void _newName(String typedName) {
    name = typedName;
  }

  void _newAmount(String typedAmount) {
    amount = typedAmount;
  }

  late Duration _selectedDuration = subscriptionToEdit.duration ??= duration.first;
  late Wallet _selectedWallet = subscriptionToEdit.wallet ??= wallets.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Edit Subscription",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextFormField(
                initialValue: name,
                onChanged: _newName,
                maxLength: 50,
                decoration: const InputDecoration(label: Text("Name")),
              ),
              TextFormField(
                initialValue: amount,
                onChanged: _newAmount,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    label: const Text(
                      "          save          ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                    onPressed: () {
                      if (name.isEmpty ||
                          amount.isEmpty ||
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
                      updateSubscription(my.Subscription(
                          subscriptionToEdit.id,
                          name,
                          int.parse(amount),
                          wallet: _selectedWallet,
                          duration: _selectedDuration,
                          DateTime.now()));
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
              )
            ],
          )),
    );
  }
}