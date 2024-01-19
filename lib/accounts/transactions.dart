import "package:app/accounts/transaction.dart";
import "package:app/models/schemas.dart";
import "package:flutter/material.dart";

class TransactionsPage extends StatefulWidget {
  final Wallet wallet;
  const TransactionsPage(this.wallet, {super.key});

  @override
  TransactionsPageState createState() => TransactionsPageState();
}

class TransactionsPageState extends State<TransactionsPage> {
  late Wallet wallet = getWallet(widget.wallet.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        floating: true,
        collapsedHeight: 160,
        // actions: [],
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "${wallet.name}",
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Total Amount Spent",
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 151, 151),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  "GHS ${wallet.balance}",
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SizedBox(
                height: 5600,
                child: Transactions(wallet),
              ),
            
          ),
        )
    ]));
  }
}
