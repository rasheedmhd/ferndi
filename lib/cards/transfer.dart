import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";

class TransferCard extends StatefulWidget {
  const TransferCard({super.key});

  @override
  TransferCardState createState() => TransferCardState();
}

class TransferCardState extends State<TransferCard> {
  Wallet _fromWallet = wallets.first;
  Wallet _toWallet = wallets.last;
  final _amountController = TextEditingController();

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
                    "Transfer",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "The amount you type below will be added to your Wallet's balance.",
                        style: TextStyle(
                          color: Color.fromARGB(255, 151, 151, 151),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text("GHS "),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "From",
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 151, 151),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                DropdownButton(
                  value: _fromWallet,
                  hint: const Text("Wallet"),
                  icon: const Icon(
                    Icons.wallet_sharp,
                    color: Color.fromARGB(255, 151, 151, 151),
                  ),
                  isExpanded: true,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                      _fromWallet = value;
                    });
                  },
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "To",
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 151, 151),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                DropdownButton(
                  value: _toWallet,
                  hint: const Text("Wallet"),
                  icon: const Icon(
                    Icons.wallet_sharp,
                    color: Color.fromARGB(255, 151, 151, 151),
                  ),
                  isExpanded: true,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                      _toWallet = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                FloatingActionButton.extended(
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
                      // if (balance.isEmpty || name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Color.fromARGB(255, 255, 231, 241),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "A Wallet must have a Name and a Balance",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 163, 9, 71)),
                            ),
                            Text(
                              "Please add a Name and Balance before saving.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 163, 9, 71)),
                            ),
                          ],
                        ),
                      ));
                      return;
                    }
                    // updateWallet(Wallet(
                    //   walletToEdit.id,
                    //   name,
                    //   double.parse(balance),
                    // ));
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //   backgroundColor: Color.fromARGB(255, 231, 255, 245),
                    //   content: Column(
                    //     children: [
                    //       Text(
                    //         "Wallet successfully updated.",
                    //         style: TextStyle(
                    //             color: Color.fromARGB(255, 9, 163, 99)),
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             "Happy Spends tracking!   ",
                    //             style: TextStyle(
                    //                 color: Color.fromARGB(255, 9, 163, 99)),
                    //           ),
                    //           Icon(Icons.sentiment_very_satisfied,
                    //               color: Color.fromARGB(255, 9, 163, 9))
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ));
                    // },
                    ),
              ],
            )));
  }
}
