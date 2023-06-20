import "package:flutter/material.dart";
import "package:app/models/wallets.dart";
import "package:google_fonts/google_fonts.dart";

final List<AccountWallet> createdWallets = [
  AccountWallet(name: "MobileMoney", amount: 3345),
  AccountWallet(name: "PocketWallet", amount: 3415),
  AccountWallet(name: "Cash", amount: 345),
  AccountWallet(name: "Ecobank", amount: 45),
];

class WalletsCard extends StatelessWidget {
  const WalletsCard({super.key});

  //final AccountWallet wallet;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: const Padding(
        padding: EdgeInsets.all(25),
        child: 
        ListTile(
          // leading: const FaIcon(
          //   FontAwesomeIcons.receipt,
          //   size: 30.0,
          //   color: Color.fromARGB(255, 240, 138, 4),
          // ),
          leading: Icon(
            Icons.abc,
            // WalletIcons[wallet.name],
            color: Color.fromARGB(255, 240, 138, 4),
          ),
          title: Text("wallet.name"),
          //subtitle: Text(wallet.),
          trailing: Text("GHS 234"),
        )
      )
    );
  }
}

// class WalletList extends StatelessWidget {
//   const WalletList({super.key, required this.wallets});

//   final List<AccountWallet> wallets;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: wallets.length,
//       itemBuilder: (BuildContext context, int index) {
//         return WalletsCard(wallets[index]);
//       }
//     );
//   }
// }