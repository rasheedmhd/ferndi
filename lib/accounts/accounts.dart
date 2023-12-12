import "package:app/cards/addWallet.dart";
import "package:app/cards/wallets.dart";
import "package:flutter/material.dart";


class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  AccountsState createState() => AccountsState();
}

class AccountsState extends State<Accounts> {
  void _addAccount() {
    showModalBottomSheet(
      context: context, 
      builder: (ctx) => const AddWalletCard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Accounts",
        home: Scaffold(
          appBar: AppBar(
            // actions: [
            //   IconButton(onPressed: _addAccount, icon: const Icon(Icons.create))
            // ],
            title: const Text(
              "Accounts and Wallets", 
              style: TextStyle(
                color: Colors.white
            ),),
            backgroundColor: const Color.fromARGB(255, 5, 61, 135),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 5, 61, 135),
            onPressed: _addAccount,
            child: const Icon(Icons.add),
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
                  color: Color.fromARGB(255, 5, 61, 135),
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
