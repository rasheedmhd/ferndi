import "package:app/accounts/transactions.dart";
import "package:app/ops/update/editWallet.dart";
// import "package:app/ops/update/saveCard.dart";
import "package:app/ops/update/topUpWallet.dart";
import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
// import "package:app/providers/wallets_provider.dart";

class SelectedWallets extends ConsumerWidget {
  const SelectedWallets(this.wallet, {super.key});
  final Wallet wallet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // void save() {
    //   showModalBottomSheet(
    //     showDragHandle: true,
    //     context: context,
    //     isScrollControlled: true,
    //     builder: (ctx) => SaveCard(wallet),
    //   );
    // }

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

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Text("Total Saved",
          //     style: TextStyle(
          //       fontSize: 25.0,
          //       color: Color.fromARGB(255, 255, 255, 255),
          //     )),
          Text(
            wallet.name,
            style: const TextStyle(
              fontSize: 25.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "GHS${wallet.bal}",
                style: const TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "add",
                mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 0,
                onPressed: () {
                  showTopUpWalletPage();
                },
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const Icon(
                  Icons.add,
                  size: 25,
                  color: Color.fromARGB(255, 48, 136, 6),
                ),
              ),
              // Text("Wallets",
              //   style: TextStyle(
              //     fontSize: 25.0,
              //     color: Color.fromARGB(255, 255, 255, 255),
              //   )
              // ),
              FloatingActionButton(
                heroTag: "edit",
                mini: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
                onPressed: () {
                  showEditPage();
                },
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const FaIcon(
                  FontAwesomeIcons.penToSquare,
                  size: 20,
                  color: Color.fromARGB(255, 48, 136, 6),
                ),
              ),
              FloatingActionButton(
                heroTag: "savings",
                mini: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
                onPressed: () {
                  showTransactionsPage();
                },
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const FaIcon(
                  FontAwesomeIcons.list,
                  size: 20,
                  color: Color.fromARGB(255, 48, 136, 6),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
