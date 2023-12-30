import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter/material.dart";
import "package:realm/realm.dart";

class AddIncomeCard extends StatefulWidget {
  const AddIncomeCard({super.key});

  @override
  AddIncomeCardState createState() => AddIncomeCardState();
}

class AddIncomeCardState extends State<AddIncomeCard> {
  final _balanceController = TextEditingController();

  @override
  void dispose() {
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Row(
                children: [
                  FaIcon(FontAwesomeIcons.wallet,
                      size: 25.0, color: Color.fromARGB(255, 251, 39, 131)),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Income"),
                ],
              ),
              const Spacer(),
              Expanded(
                child: TextField(
                  controller: _balanceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text("GHS  "),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: "1000",
                    label: Text("Balance"),
                    isDense: true
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
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
              if (_balanceController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 255, 231, 241),
                content: Column(
                  children: [
                    Text(
                      "Income Wallet can not be Empty. Add Balance.",
                      style: TextStyle(color: Color.fromARGB(255, 163, 9, 71)),
                    ),
                  ],
                ),
              ));               
                return;
              }
              createWallet(Wallet(
                ObjectId(),
                "Income",
                int.tryParse(_balanceController.text) ?? 0,
              ));
              _balanceController.clear();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 231, 255, 245),
                content: Column(
                  children: [
                    Text(
                      "Income Wallet successfully created.",
                      style: TextStyle(color: Color.fromARGB(255, 9, 163, 99)),
                    ),
                    Text(
                      "Now Swipe right to add Categories",
                      style: TextStyle(color: Color.fromARGB(255, 9, 163, 99)),
                    ),
                  ],
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
