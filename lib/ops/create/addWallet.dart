import "package:app/models/schemas.dart";
import 'package:app/providers/wallets_provider.dart';
import "package:flutter/material.dart";
import "package:realm/realm.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:flutter/services.dart';

class AddWalletCard extends ConsumerStatefulWidget {
  const AddWalletCard({super.key});

  @override
  AddWalletCardState createState() => AddWalletCardState();
}

class AddWalletCardState extends ConsumerState<AddWalletCard> {
  final _nameController = TextEditingController();
  final _balanceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Wallet"),
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
            children: [
              TextField(
                controller: _nameController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50), // Limit the number of characters
                ],
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
              ),
              TextField(
                controller: _balanceController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10), // Limit the number of characters
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text("GHS "),
                  label: Text("Balance"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FloatingActionButton.extended(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                label: const Text(
                  "       save       ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                onPressed: () {
                  final returnedWallet = ref.read(getWalletByName(_nameController.text));
                  if (_nameController.text.toLowerCase() ==
                      returnedWallet?.name.toLowerCase()) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromARGB(255, 255, 231, 241),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Wallet already exist!",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 163, 9, 71)),
                            ),
                          ],
                        ),
                      ),
                    );
                    return;
                  }
                  if (_balanceController.text.isEmpty ||
                      _nameController.text.isEmpty) {
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
                                  color: Color.fromARGB(255, 163, 9, 71)),
                            ),
                            Text(
                              "Please add a Name and Balance before saving.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 163, 9, 71)),
                            ),
                          ],
                        ),
                      ),
                    );
                    return;
                  }
                  ref.read(walletsNotifier.notifier).createWallet(
                        Wallet(ObjectId(), _nameController.text,
                            int.parse(_balanceController.text), DateTime.now()),
                      );
                  _nameController.clear();
                  _balanceController.clear();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 231, 255, 245),
                      content: Column(
                        children: [
                          Text(
                            "Wallet created successfully.",
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
      ),
    );
  }
}
