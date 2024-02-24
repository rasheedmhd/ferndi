import "package:app/accounts/transactions.dart";
import "package:app/ops/update/topUpWallet.dart";
import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:app/ops/update/editWallet.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter_riverpod/flutter_riverpod.dart"; 
import "package:app/providers/wallets_provider.dart";
import "package:app/providers/spends_provider.dart";

class WalletItem extends ConsumerWidget {
  const WalletItem(this.wallet, {super.key});

  final Wallet wallet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showWalletEditForm() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => EditWalletCard(wallet)));
    }

    void showTopUpWalletPage() {
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) => TopUpWalletCard(wallet),
      );
    }

    void showEditPage() {
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) => EditWalletCard(wallet),
      );
    }

    void showTransactionsPage() {
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) => TransactionsPage(wallet),
      );
    }

    final int spendsCount = ref.watch(spendsByWallet(wallet.name)).length;

    return Column(
      children: [
        Slidable(
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(wallet.id),

          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // A pane can dismiss the Slidable.
            dismissible: DismissiblePane(onDismissed: () {
              ref.read(walletsNotifier.notifier).deleteWallet(wallet);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 255, 231, 241),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wallet Deleted",
                      style: TextStyle(
                        color: Color.fromARGB(255, 163, 9, 71),
                      ),
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
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 230, 243, 255),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Slide through to delete",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 128, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) {
                  showWalletEditForm();
                },
                backgroundColor: const Color.fromARGB(255, 96, 150, 249),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(71, 47, 136, 6),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                collapsedBackgroundColor: Colors.white,
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.white,
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 204, 241, 228),
                  child: FaIcon(
                    FontAwesomeIcons.wallet,
                    size: 20,
                    color: Color.fromARGB(255, 48, 136, 6),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      wallet.name,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  wallet.bal,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 48, 136, 6),
                  ),
                ),
                children: [
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(7)),
                      GestureDetector(
                        onTap: () {
                          showTransactionsPage();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            color: const Color.fromARGB(200, 109, 189, 255),
                            child: Text(
                              " $spendsCount transactions ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          showEditPage();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            color: const Color.fromARGB(199, 71, 34, 255),
                            child: const Text(
                              " edit ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          showTopUpWalletPage();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            color: const Color.fromARGB(255, 23, 213, 110),
                            child: const Text(
                              " top up ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}

class WalletsCard extends ConsumerWidget {
  const WalletsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(walletsNotifier);
    return WalletList(
      wallets: wallets,
    );
  }
}

class WalletList extends StatelessWidget {
  const WalletList({super.key, required this.wallets});

  final List<Wallet> wallets;

  @override
 Widget build(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (wallets.isEmpty)
        const Center(
          child: Text("You have no Wallets yet!"),
        )
      else
        Flexible(
          child: ListView.builder(
            reverse: true,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: wallets.length,
            itemBuilder: (BuildContext context, int index) {
              return WalletItem(wallets[index]);
            },
          ),
        ),
      ],
    );
  }
}
