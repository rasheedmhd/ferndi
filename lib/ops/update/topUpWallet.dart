import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";

class TopUpWalletCard extends StatefulWidget {
  final Wallet wallet;
  const TopUpWalletCard(this.wallet, {super.key});

  @override
  TopUpWalletCardState createState() => TopUpWalletCardState();
}

class TopUpWalletCardState extends State<TopUpWalletCard> {
  late Wallet walletToEdit = getWallet(widget.wallet.id);

  final _balanceController = TextEditingController();

  late String name = walletToEdit.name;
  late int balance = walletToEdit.balance;

  void _newBalance(String typedBalance) {
    balance += int.parse(_balanceController.text);
  }

  @override
  void dispose() {
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Top up $name",
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Current Balance",
                  style: TextStyle(
                    color: Color.fromARGB(255, 151, 151, 151),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "GHS ${walletToEdit.balance}",
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
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
                controller: _balanceController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text("GHS "),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      _newBalance(_balanceController.text);
                      if (balance.toString().isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255, 255, 231, 241),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "A Wallet must have a Balance",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71)),
                              ),
                              Text(
                                "Please add Balance before saving.",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71)),
                              ),
                            ],
                          ),
                        ));
                        return;
                      }
                      updateWallet(Wallet(
                        walletToEdit.id,
                        name,
                        balance,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Color.fromARGB(255, 231, 255, 245),
                        content: Column(
                          children: [
                            Text(
                              "You have successfully topped up your Wallet.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 163, 99)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Happy tracking your Spends!   ",
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
              ),
            ],
          )),
    );
  }
}
