import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:realm/realm.dart";

class WalletItem extends StatelessWidget {
  const WalletItem(this.wallet, {super.key});

  final Wallet wallet;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: ValueKey(key),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          deleteWallet(wallet);
          print("spend wallet from sliding through");
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
          deleteWallet(wallet);
              print("deleted wallet object from pressing delete");
            },
            backgroundColor:const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: 
      Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child:  ExpansionTile(
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
