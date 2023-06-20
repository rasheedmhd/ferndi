import "package:flutter/material.dart";
import "package:app/models/spend.dart";
import "package:app/models/wallets.dart";

class SpendItem extends StatelessWidget {
  const SpendItem(this.spend, {super.key});

  final Spend spend;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(CategoryIcons[spend.category],
        color: const Color.fromARGB(255, 240, 138, 4),),
        title: Text(spend.name),
        subtitle: Text(spend.getWallet),
        trailing: Text(spend.getAmount),
    );
    // UI ONE
    // return Card(
    //   child: ListTile(
    //     leading: const FaIcon(
    //       FontAwesomeIcons.receipt,
    //       size: 30.0,
    //       color: Color.fromARGB(255, 240, 138, 4),
    //     ),
    //     title: Text(spend.name),
    //     subtitle: Text(spend.getWallet),
    //     trailing: Text(spend.getAmount),
    //   ),
    // );
  }
}

final List<Spend> recordedSpends = [
  Spend(
    name: "Monitor",
    notes: "Dell 27\" 4K Monitor for programming",
    amount: 2700,
    wallet: Wallet.MobileMoney,
    category: Category.Work,
  ),
  Spend(
    name: "Mouse",
    notes: "Logitech MX Master 3 mouse to help with my Carpal Tunnel Syndrome",
    amount: 2300,
    wallet: Wallet.MobileMoney,
    category: Category.Work,
  ),
  Spend(
    name: "Petrol",
    notes: "For My motor",
    amount: 100,
    wallet: Wallet.AccessDebitCard,
    category: Category.Transportation,
  ),
  Spend(
    name: "Madrid Jersey",
    notes: "From Gaskia",
    amount: 170,
    wallet: Wallet.MobileMoney,
    category: Category.Miscellaneous,
  ),
  Spend(
    name: "Baby Rice",
    notes: "Baby Rice from Two Sisters alias Safura",
    amount: 15,
    wallet: Wallet.Cash,
    category: Category.Food,
  ),
  Spend(
    name: "Ulcer Medication",
    notes: "RONAKCID Omeprezole + Antacid",
    amount: 34,
    wallet: Wallet.Cash,
    category: Category.Health,
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
    return Card(
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
      }
    );
  }
}
