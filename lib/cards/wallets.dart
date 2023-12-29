import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 255, 231, 241),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wallet Deleted",
                      style: TextStyle(
                          color: Color.fromARGB(255, 163, 9, 71)),
                    ),
                  ],
                ),
              ));
          }),

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context) {
                deleteWallet(wallet);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ExpansionTile(
              shape: const Border(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    wallet.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    wallet.bal,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Color.fromARGB(255, 95, 98, 103),
                      fontWeight: FontWeight.w700,
                      // fontFamily: "WorkSans"
                    ),
                  ),
                ],
              ),
              subtitle: const Row(children: []),
              children: [
                Row(children: [
                  const Padding(padding: EdgeInsets.all(7)),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                          padding: const EdgeInsets.all(7),
                          color: const Color.fromARGB(200, 109, 189, 255),
                          child: const Text(
                            "transactions",
                            style: TextStyle(color: Colors.white),
                          ))),
                  const SizedBox(width: 10,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                          padding: const EdgeInsets.all(7),
                          color: const Color.fromARGB(199, 71, 34, 255),
                          child: const Text(
                            "edit",
                            style: TextStyle(color: Colors.white),
                          ))),
                ]),

                const SizedBox(height: 10,),
                
                Row(children: [
                  const Padding(padding: EdgeInsets.all(7)),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                          padding: const EdgeInsets.all(7),
                          color: const Color.fromARGB(136, 12, 227, 123),
                          child: const Text(
                            "add",
                            style: TextStyle(color: Colors.white),
                          ))),
                          const SizedBox(width: 10,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                          padding: const EdgeInsets.all(7),
                          color: const Color.fromARGB(135, 255, 174, 0),
                          child: const Text(
                            "transfer",
                            style: TextStyle(color: Colors.white),
                          ))),
                          const SizedBox(width: 10,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                          padding: const EdgeInsets.all(7),
                          color: const Color.fromARGB(136, 255, 0, 174),
                          child: const Text(
                            "withdraw",
                            style: TextStyle(color: Colors.white),
                          ))),
                ]),
              const SizedBox(height: 10,),
              ],
            )));
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
