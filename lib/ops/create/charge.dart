import "package:app/providers/wallets_provider.dart";
import 'package:app/models/schemas.dart' as my;
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ChargeCard extends ConsumerStatefulWidget {
  final my.Subscription subscription;
  const ChargeCard(this.subscription, {super.key});

  @override
  ChargeCardState createState() => ChargeCardState();
}

class ChargeCardState extends ConsumerState<ChargeCard> {
  @override
  Widget build(BuildContext context) {
    final sub = widget.subscription;

    return SizedBox(
      height: 300,
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
                  Text("If you Charge, GHS ${sub.getAmount} will be deducted from ${sub.wallet!.name} to pay for ${sub.name} and Recorded as a Spend"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Proceed to Charge"),

                  const SizedBox(
                    height: 10,
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
