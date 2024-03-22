import "package:app/providers/spends_provider.dart";
import 'package:app/providers/wallets_provider.dart' as P;
import "package:app/utility/schema/methods.dart";

import 'package:app/models/schemas.dart';
import 'package:app/models/schemas.dart' as my;
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:realm/realm.dart";

class ChargeCard extends ConsumerStatefulWidget {
  final my.Subscription subscription;
  const ChargeCard(this.subscription, {super.key});

  @override
  ChargeCardState createState() => ChargeCardState();
}

class ChargeCardState extends ConsumerState<ChargeCard> {
  @override
  Widget build(BuildContext context) {
    final subscriptionToCharge = widget.subscription;
    Category subscriptionToChargeCategory = categories.isEmpty
      ? Category(ObjectId(), "Subscriptions", "💞", "", DateTime.now())
      : categories.first;

    return SizedBox(
      height: 320,
      child: Padding(
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
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "How Charge Works",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135)
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),                  
                  const Text("Charge is how you pay your Subscriptions."),
                  Text("If you Charge, GHS ${subscriptionToCharge.getAmount} will be deducted from ${subscriptionToCharge.wallet!.name} to pay for ${subscriptionToCharge.name} and Recorded as a Spend"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Proceed to Charge"),

                  const SizedBox(
                    height: 10,
                  ),
                   FloatingActionButton.extended(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    label: const Text(
                      "          Charge         ",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                    onPressed: () {
                      if (subscriptionToCharge.amount >
                          subscriptionToCharge.wallet!.balance) {
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
                                "Paid for ${subscriptionToCharge.name}",
                                "Paid for ${subscriptionToCharge.name} which happens every ${subscriptionToCharge.createdAt}  ",
                                subscriptionToCharge.amount,
                                category: subscriptionToChargeCategory,
                                wallet: subscriptionToCharge.wallet,
                                DateTime.now(),
                              ),
                            );
                        ref.read(P.walletsNotifier.notifier).updateWallet(
                              Wallet(subscriptionToCharge.wallet!.id, subscriptionToCharge.wallet!.name,
                                  subscriptionToCharge.amount, DateTime.now()),
                            );
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
                                      "Spend successfully recorded. ",
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
                  // ref.watch(subscriptionsNotifier.notifier).addSubscription(
                  //       my.Subscription(
                  //         ObjectId(),
                  //         _nameController.text,
                  //         int.tryParse(_amountController.text) ?? 0,
                  //         wallet: _selectedWallet,
                  //         duration: _selectedDuration,
                  //         DateTime.now(),
                  //       ),
                  //       //     );
                  //           _nameController.clear();
                  //           _amountController.clear();
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //             const SnackBar(
                  //               backgroundColor: Color.fromARGB(255, 231, 255, 245),
                  //               content: Column(
                  //                 children: [
                  //                   Row(
                  //                     mainAxisAlignment: MainAxisAlignment.center,
                  //                     children: [
                  //                       Text(
                  // //                         "Subscription successfully recorded your. yay! ",
                  //                         style: TextStyle(
                  //                           color: Color.fromARGB(255, 9, 163, 99),
                  //                         ),
                  //                       ),
                  //                       Icon(
                  //                         Icons.sentiment_very_satisfied,
                  //                         color: Color.fromARGB(255, 9, 163, 9),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //           Navigator.of(context).pop();
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
          ),
        ),
      ),
    );
  }
}
