import "package:flutter/material.dart";
import "package:app/models/schemas.dart";

// final List<AccountWallet> createdWallets = [
//   AccountWallet(name: "Mobile Money", amount: 3345),
//   AccountWallet(name: "Pocket Wallet", amount: 3415),
//   AccountWallet(name: "Cash", amount: 345),
//   AccountWallet(name: "Ecobank", amount: 45),
// ];

class WalletItem extends StatelessWidget {
  const WalletItem(this.wallet, {super.key});

  final _Wallet wallet;
  // final AccountWallet wallet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            wallet.name,
            style: const TextStyle(
              fontSize: 24.0,
              color: Color.fromARGB(255, 26, 114, 255),
              fontWeight: FontWeight.w700,
              // fontFamily: "WorkSans"
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            wallet.getAmount,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 95, 98, 103),
              fontWeight: FontWeight.w700,
              // fontFamily: "WorkSans"
            ),
          ),
        ],
      ),
    );
  }
}

class WalletsCard extends StatelessWidget {
  const WalletsCard({super.key});

  //final AccountWallet wallet;

  @override
  Widget build(BuildContext context) {
    return WalletList(
      wallets: createdWallets,
    );
    // return Card(
    //     shape:
    //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    //     child: const Padding(
    //         padding: EdgeInsets.all(25),
    //         child: ListTile(
    //           // leading: const FaIcon(
    //           //   FontAwesomeIcons.receipt,
    //           //   size: 30.0,
    //           //   color: Color.fromARGB(255, 240, 138, 4),
    //           // ),
    //           leading: Icon(
    //             Icons.abc,
    //             // WalletIcons[wallet.name],
    //             color: Color.fromARGB(255, 240, 138, 4),
    //           ),
    //           title: Text("wallet.name"),
    //           //subtitle: Text(wallet.),
    //           trailing: Text("GHS 234"),
    //         )));
  }
}

class WalletList extends StatelessWidget {
  const WalletList({super.key, required this.wallets});

  final List<AccountWallet> wallets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: wallets.length,
        itemBuilder: (BuildContext context, int index) {
          return WalletItem(wallets[index]);
        });
  }
}
