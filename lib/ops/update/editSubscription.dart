import 'package:app/models/schemas.dart';
import "package:app/utility/schema/methods.dart";
import 'package:app/models/schemas.dart' as my;
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:app/providers/subs_provider.dart";
import 'package:flutter/services.dart';
import "package:intl/intl.dart";

class EditSubscriptionCard extends ConsumerStatefulWidget {
  final my.Subscription subscription;
  const EditSubscriptionCard(this.subscription, {super.key});

  @override
  EditSubscriptionCardState createState() => EditSubscriptionCardState();
}

class EditSubscriptionCardState extends ConsumerState<EditSubscriptionCard> {
  late my.Subscription subscriptionToEdit =
      ref.watch(getSubscription(widget.subscription.id));

  late String name        = subscriptionToEdit.name;
  late String amount      = subscriptionToEdit.amount.toString();
  late DateTime date      = subscriptionToEdit.chargeAt;
  final _dateController   = TextEditingController();

  void _newName(String typedName) {
    name = typedName;
  }

  void _newAmount(String typedAmount) {
    amount = typedAmount;
  }

  late Duration _selectedDuration =
      subscriptionToEdit.duration ??= duration.first;
  late Wallet _selectedWallet = subscriptionToEdit.wallet ??= wallets.first;

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
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Subscription"),
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
              TextFormField(
                initialValue: name,
                onChanged: _newName,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50), // Limit the number of characters
                ],
                decoration: const InputDecoration(
                    label: Text("Name"), border: InputBorder.none),
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),
              TextFormField(
                initialValue: amount,
                onChanged: _newAmount,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10), // Limit the number of characters
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefix: Text("GHS "),
                    label: Text("Amount"),
                    border: InputBorder.none),
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),
              TextField(
                controller: _dateController,
                onChanged: newDate,
                readOnly: true,
                decoration: InputDecoration(
                  iconColor: const Color.fromARGB(255, 151, 151, 151),
                  icon: const FaIcon(
                    FontAwesomeIcons.calendarDay,
                    size: 24,
                  ),
                  border: InputBorder.none,
                  label:Text(DateFormat("EEEE, dd MMMM, yyyy").format(date)),
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
                      value: _selectedWallet,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      icon: const Icon(
                        Icons.wallet_sharp,
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
                            _selectedWallet = value;
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
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                        setState(
                          () {
                            _selectedDuration = value;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                    onPressed: () {
                      if (name.isEmpty ||
                          amount.isEmpty ||
                          _selectedDuration.name.isEmpty ||
                          _selectedWallet.name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
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
                                          color:
                                              Color.fromARGB(255, 163, 9, 71)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                        return;
                      }
                      ref
                          .watch(subscriptionsNotifier.notifier)
                          .updateSubscription(
                            my.Subscription(
                              subscriptionToEdit.id,
                              name,
                              double.parse(amount),
                              wallet: _selectedWallet,
                              duration: _selectedDuration,
                              // CreatedAt
                              DateTime.now(),
                              // ChargeAt
                              DateFormat("EEEE, dd MMMM, yyyy")
                                  .tryParse(_dateController.text) ??
                              date,
                            ),
                          );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
