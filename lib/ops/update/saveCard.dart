import "package:app/models/schemas.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/wallets_provider.dart";
import 'package:flutter/services.dart';
// import "package:app/utility/util/sub_string.dart";
// import "package:app/utility/util/fmt_neg_bal.dart";

class SaveCard extends ConsumerStatefulWidget {
  final Wallet? wallet;
  const SaveCard(this.wallet, {super.key});

  @override
  SaveCardState createState() => SaveCardState();
}

// [[ TO DO ]]
// Use Provider to have edited wallets refresh LIVE in SavingsCard
class SaveCardState extends ConsumerState<SaveCard> {
  late Wallet? walletToEdit = ref.watch(getWallet(widget.wallet!.id));

  final _balanceController = TextEditingController();

  late String name = walletToEdit!.name;
  late double balance = walletToEdit!.balance;
  late String balanceAsString = walletToEdit!.balance.toStringAsFixed(2);

  void _newBalance(String typedBalance) {
    balance += double.parse(_balanceController.text);
  }

  @override
  void dispose() {
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Savings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 227, 226, 226),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              // const Align(
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     "Current Balance",
              //     style: TextStyle(
              //       color: Color.fromARGB(255, 151, 151, 151),
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     fmtBalance(balanceAsString),
              //     style: const TextStyle(
              //       fontSize: 30.0,
              //       color: Color.fromARGB(255, 5, 61, 135),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: const Color.fromARGB(255, 240, 240, 240),
              //       borderRadius: BorderRadius.circular(8.0)),
              //   child: const Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Text(
              //       "The amount you type below will be added to your Wallet's balance.",
              //       style: TextStyle(
              //         color: Color.fromARGB(255, 151, 151, 151),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              TextField(
                controller: _balanceController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      10), // Limit the number of characters
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefix: Text("GHS"), border: InputBorder.none),
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      elevation: 1,
                      heroTag: "save",
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      label: const Text(
                        "       save      ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                      onPressed: () {
                        if (_balanceController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor:
                                  Color.fromARGB(255, 230, 243, 255),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No Savings was added.",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 128, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          Navigator.of(context).pop();
                          return;
                        }
                        _newBalance(_balanceController.text);
                        ref.read(walletsNotifier.notifier).updateWallet(
                              Wallet(walletToEdit!.id, name, balance,
                                  DateTime.now()),
                            );
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color.fromARGB(255, 231, 255, 245),
                            content: Column(
                              children: [
                                Text(
                                  "Wallet topped up successfully.",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 9, 163, 99),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Happy Spend tracking!   ",
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
            ],
          ),
        ),
      ),
    );
  }
}
