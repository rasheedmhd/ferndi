import "package:app/accounts/transaction.dart";
import "package:app/models/schemas.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/spends_provider.dart";
import "package:app/providers/wallets_provider.dart";

class TransactionsPage extends ConsumerStatefulWidget {
  final Wallet wallet;
  const TransactionsPage(this.wallet, {super.key});

  @override
  TransactionsPageState createState() => TransactionsPageState();
}

class TransactionsPageState extends ConsumerState<TransactionsPage> {
  // late Wallet wallet = getWallet(widget.wallet.id);
  late Wallet? wallet = ref.watch(getWallet(widget.wallet.id));

  @override
  Widget build(BuildContext context) {
    
    // This reads a provider from the wallets_provider.dart file, which depends on
    // another provider in the same file that returns all spends made under a particular
    // wallet when give the name of the wallet.
    // So spendsTotal gives us the total amount of all the money spent from a particular wallet
    final spendsTotal = ref.watch(spendsByWalletTotal(wallet!.name));

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          collapsedHeight: 170,
          title: const Text("Transactions"),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                    child: Text(
                      wallet!.name,
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 5, 61, 135),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Total amount spent",
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 61, 135),
                      ),
                    ),
                  ),
                  Text(
                    "GHS $spendsTotal",
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Transactions(wallet),
          ),
        ),
      ],
    );
  }
}
