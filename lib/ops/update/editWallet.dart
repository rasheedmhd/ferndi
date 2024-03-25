import "package:app/models/schemas.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/wallets_provider.dart";
import 'package:flutter/services.dart';

class EditWalletCard extends ConsumerStatefulWidget {
  final Wallet wallet;
  const EditWalletCard(this.wallet, {super.key});

  @override
  EditWalletCardState createState() => EditWalletCardState();
}

class EditWalletCardState extends ConsumerState<EditWalletCard> {
  late Wallet? walletToEdit = ref.read(getWallet(widget.wallet.id));

  late String name = walletToEdit!.name;
  late String balance = walletToEdit!.balance.toString();

  void _newName(String typedName) {
    name = typedName;
  }

  void _newBalance(String typedBalance) {
    balance = typedBalance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Wallet"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 227, 226, 226),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                onChanged: _newName,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      50), // Limit the number of characters
                ],
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Wallet Name"),
                  border: InputBorder.none
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),              
              TextFormField(
                initialValue: balance,
                onChanged: _newBalance,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      10), // Limit the number of characters
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefix: Text("GHS "), label: Text("Balance"),
                    border: InputBorder.none
                  ),
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),              
              const SizedBox(
                height: 40,
              ),
              Row(
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
                      // final returnedWallet = ref.read(getWalletByName(name));
                      // if (returnedWallet != null)
                      // // if (name.toLowerCase() ==
                      // //     returnedWallet?.name.toLowerCase() && balance == balance)
                      //     {
                      //   ScaffoldMessenger.of(context).clearSnackBars();
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       backgroundColor: Color.fromARGB(255, 255, 231, 241),
                      //       content: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             "Wallet already exist!",
                      //             style: TextStyle(
                      //                 color: Color.fromARGB(255, 163, 9, 71)),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   );
                      //   return;
                      // }
                      if (balance.isEmpty || name.isEmpty) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color.fromARGB(255, 255, 231, 241),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "A Wallet must have a Name and a Balance",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71),
                                  ),
                                ),
                                Text(
                                  "Please add a Name and Balance before saving.",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        return;
                      }
                      ref.read(walletsNotifier.notifier).updateWallet(
                            Wallet(walletToEdit!.id, name,
                                double.parse(balance), DateTime.now()),
                          );
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color.fromARGB(255, 231, 255, 245),
                          content: Column(
                            children: [
                              Text(
                                "Wallet updated successfully.",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 9, 163, 99)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Happy Spend tracking!   ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 9, 163, 99)),
                                  ),
                                  Icon(Icons.sentiment_very_satisfied,
                                      color: Color.fromARGB(255, 9, 163, 9))
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
            ],
          ),
        ),
      ),
    );
  }
}
