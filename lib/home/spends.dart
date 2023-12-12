import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:realm/realm.dart";

class SpendItem extends StatelessWidget {
  const SpendItem(this.spend, {super.key});

  final Spend spend;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const FaIcon(
        FontAwesomeIcons.featherPointed,
        size: 30.0,
        color: Color.fromARGB(255, 5, 61, 135),
      ),
      title: Text(spend.name),
      subtitle: Text(spend.notes),
      trailing: Text(spend.amount),
    );
  }
}

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
    //   child: SpendList(spends: spends()),
    // );
    return SpendList(spends: spends());
  }
}

class SpendList extends StatelessWidget {
  const SpendList({super.key, required this.spends});

  final RealmResults<Spend> spends;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: spends.length,
                itemBuilder: (BuildContext context, int index) {
                  return SpendItem(spends[index]);
                }))
      ],
    );
  }
}
