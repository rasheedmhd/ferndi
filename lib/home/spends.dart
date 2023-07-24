import "package:flutter/material.dart";
import "package:app/models/schemas.dart";


class SpendItem extends StatelessWidget {
  const SpendItem(this.spend, {super.key});

  final _Spend spend;

  @override
  Widget build(BuildContext context) {
    // return
    // ListTile(
    //     leading: Icon(CategoryIcons[spend.category],
    //     color: const Color.fromARGB(255, 240, 138, 4),),
    //     title: Text(spend.name),
    //     subtitle: Text(spend.getWallet),
    //     trailing: Text(spend.getAmount),
    // );
    // UI ONE
    return ListTile(
      leading: Icon(
        CategoryIcons[spend.category],
        size: 25.0,
        color: const Color.fromARGB(255, 240, 138, 4),
      ),
      title: Text(spend.name),
      subtitle: Text(spend.getWallet),
      trailing: Text(spend.getAmount),
    );
    //);
  }
}

final List<Spend> recordedSpends = [
  // Spend(
  //   name: "Ulcer Medication",
  //   notes: "RONAKCID Omeprezole + Antacid",
  //   amount: 34,
  //   wallet: Wallet.Cash,
  //   category: Category.Health,
  // ),
];

class Spends extends StatefulWidget {
  const Spends({super.key});

  @override
  SpendState createState() => SpendState();
}

class SpendState extends State<Spends> {
  @override
  Widget build(BuildContext context) {
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    //   child: SpendList(spends: recordedSpends),
    // );
    return SpendList(spends: recordedSpends);
  }
}

class SpendList extends StatelessWidget {
  const SpendList({super.key, required this.spends});

  final List<Spend> spends;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: spends.length,
            itemBuilder: (BuildContext context, int index) {
              return SpendItem(spends[index]);
            }));
  }
}
