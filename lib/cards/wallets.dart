import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:realm/realm.dart";

class WalletItem extends StatelessWidget {
  const WalletItem(this.wallet, {super.key});

  final Wallet wallet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              wallet.name,
              style: const TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 26, 114, 255),
                fontWeight: FontWeight.w700,
                // fontFamily: "WorkSans"
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              wallet.balance,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color.fromARGB(255, 95, 98, 103),
                fontWeight: FontWeight.w700,
                // fontFamily: "WorkSans"
              ),
            ),
          ],
        ),
        subtitle: const Row(
          children: [
        ]),

        children: const [ 
          Row(
            children: [
            Text("[ transactions ]"),
            Text("[ edit ]"), 
            ]
        ),
          Row(
            children: [
            Text("[ transfer money ]"),
            Text("[ add money ]"),
            Text("[ withdraw money ]"),
            ]
        )
        ],
      ) 
    );
  }
}

class WalletsCard extends StatelessWidget {
  const WalletsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return WalletList(
      wallets: wallets,
    );
  }
}

class WalletList extends StatelessWidget {
  const WalletList({super.key, required this.wallets});

  final RealmResults<Wallet> wallets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: wallets.length,
        itemBuilder: (BuildContext context, int index) {
          return WalletItem(wallets[index]);
        });
  }
}
