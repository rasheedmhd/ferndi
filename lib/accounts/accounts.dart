// import "package:app/cards/balance.dart";
import "package:app/cards/addSpend.dart";
import "package:app/cards/wallets.dart";
// import "package:app/home/spends.dart";
import "package:flutter/material.dart";
// import "package:app/models/wallets.dart";
// import "package:app/cards/savings.dart";
// import "package:google_fonts/google_fonts.dart";

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  AccountsState createState() => AccountsState();
}

class AccountsState extends State<Accounts> {
  void _addAccount() {
    showModalBottomSheet(context: context, builder: (ctx) => AddSpendCard());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Accounts",
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: _addAccount, icon: const Icon(Icons.add))
            ],
            title: const Text("Accounts and Wallets"),
            backgroundColor: const Color.fromARGB(255, 26, 114, 255),
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: const [
              // savingsCard(),
              SizedBox(
                height: 12,
              ),
              Text(
                "Wallets",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 26, 114, 255),
                  fontWeight: FontWeight.w700,
                  // fontFamily: "WorkSans"
                ),
              ),

              SizedBox(
                height: 12,
              ),

              Divider(),

              SizedBox(
                height: 700,
                child: WalletsCard(),
              )
              // SizedBox(
              //   height: 730,
              //   child: ListView(
              //     // Future Feature
              //     // scrollDirection: Axis.horizontal,
              //     children: const [
              //       BalanceCard(),
              //       savingsCard(),
              //       savingsCard(),
              //       BalanceCard(),
              //     ],
              //   ),
              // ),
            ],
          ),
        ));
  }
}
