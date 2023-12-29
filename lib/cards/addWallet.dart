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
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
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
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text("Wallet Name")),
          ),
          TextField(
            controller: _balanceController,
            maxLength: 5,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefix: FaIcon(
                FontAwesomeIcons.cediSign,
                size: 14.0,
              ),
              label: Text("Balance")),
          ),

          const SizedBox(
            height: 40,
          ),

          Row(
            children: [
              FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
                  label: const Icon(Icons.close),
                backgroundColor: const Color.fromARGB(255, 255, 231, 241),
                foregroundColor: const Color.fromARGB(255, 163, 9, 71),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                label: const Text(
                  "       save wallet       ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                onPressed: () {
                  createWallet(Wallet(
                    ObjectId(),
                    _nameController.text,
                    int.tryParse(_balanceController.text) ?? 0,
                  ));
                  _nameController.clear();
                  _balanceController.clear();
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
