import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter/material.dart";
import "package:realm/realm.dart";

class AddWalletCard extends StatefulWidget {
  const AddWalletCard({super.key});

  @override
  AddWalletCardState createState() => AddWalletCardState();
}

class AddWalletCardState extends State<AddWalletCard> {
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
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Add Wallet",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _nameController,
                  //maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text("Wallet Name")),
                ),
                TextField(
                  controller: _balanceController,
                  //maxLength: 5, // redundant check
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefix: FaIcon(
                        FontAwesomeIcons.cediSign,
                        size: 14.0,
                        // color: Color.fromARGB(255, 26, 114, 255),
                      ),
                      label: Text("Balance")),
                ),

                const SizedBox(
                  height: 40,
                ),

                FloatingActionButton.extended(
                  label: const Text(
                    "Save Wallet",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                  icon: const Icon(Icons.wallet, size: 34.0),
                  onPressed: () {
                    print(
                      num.parse(_balanceController.text),
                    );
                    createWallet(Wallet(
                      ObjectId(),
                      _nameController.text,
                      int.parse(_balanceController.text), 
                      // num.tryParse(_balanceController.text) ?? 0.0,
                    ));
                    print(
                      num.parse(_balanceController.text),
                    );
                    _nameController.text = "";
                    _balanceController.text = "";
                  },
                ),

                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // ElevatedButton(
                //       //   onPressed: () {}, child: const Text("Cancel")),
                //     ElevatedButton(
                //       onPressed: () {
                //         print(_nameController.text);
                //         print(_balanceController.text);
                //       },
                //       child: const Text("Save Wallet")
                //     )
                //   ],
                // )
              ],
            )));
  }
}
