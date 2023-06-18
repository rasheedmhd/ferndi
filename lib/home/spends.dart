import "package:flutter/material.dart";
import "package:app/models/spend.dart";
import "package:app/models/wallets.dart";

class SpendItem extends StatelessWidget {
  const SpendItem(this.spend, {super.key});

  final Spend spend;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const Icon(Icons.payment),
        Text(spend.name),
        //Text(?spend.description),
        Text(spend.getAmount),
        Text(spend.getWallet),
        Text(spend.getCategory),
      ],
    ));
  }
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
    name: "Mouse",
    description:
        "Logitech MX Master 3 mouse to help with my Carpal Tunnel Syndrome",
    amount: 2300,
    wallet: Wallet.MobileMoney,
    category: Category.Work,
  ),
  Spend(
    name: "Petrol",
    description:
        "Logitech MX Master 3 mouse to help with my Carpal Tunnel Syndrome",
    amount: 100,
    wallet: Wallet.PocketWallet,
    category: Category.Transportation,
  ),
];

class Spends extends StatefulWidget {
  const Spends({super.key});

  @override
  SpendState createState() => SpendState();
}

class SpendState extends State<Spends> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpendList(spends: recordedSpends),
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
          return SpendItem(spends[index]);
        });
  }
}
