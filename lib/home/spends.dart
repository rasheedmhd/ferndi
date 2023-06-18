import "package:flutter/material.dart";
import "package:app/models/spend.dart";
import "package:app/models/wallets.dart";

class Spends extends StatefulWidget {
  const Spends({super.key});

  @override
  SpendState createState() => SpendState();
}

final List<Spend> recordedSpends = [
  Spend(
    name: "Monitor",
    description: "Dell 27\" 4K Monitor for programming",
    amount: 2700,
    wallet: Wallet.MobileMoney,
    category: Category.Work,
  ),
  Spend(
    name: "Mousse",
    description:
        "Logitech MX Master 3 mouse to help with my Carpal Tunnel Sydrome",
    amount: 2300,
    wallet: Wallet.MobileMoney,
    category: Category.Work,
  ),
  Spend(
    name: "Petrol",
    description:
        "Logitech MX Master 3 mouse to help with my Carpal Tunnel Sydrome",
    amount: 100,
    wallet: Wallet.PocketWallet,
    category: Category.Transportation,
  ),
];

class SpendState extends State<Spends> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("The Chart"),
          SpendList(spends: recordedSpends),
        ],
      )
    );
  }
}

class SpendList extends StatelessWidget {
  const SpendList({super.key, required this.spends});

  final List<Spend> spends;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: spends.length,
        itemBuilder: (BuildContext context, int index) {
          return SpendList(spends: recordedSpends);
        }
      );
  }
}
