import "package:app/ops/update/editSpend.dart";
import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:realm/realm.dart";

class SpendItem extends StatelessWidget {
  const SpendItem(this.spend, {super.key});

  final Spend spend;

  void _showSpendEditForm(BuildContext context, Spend spend) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => EditSpendCard(spend)));
  }

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
          deleteSpend(spend);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color.fromARGB(255, 255, 231, 241),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Spend Deleted",
                  style: TextStyle(color: Color.fromARGB(255, 163, 9, 71)),
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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 230, 243, 255),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Slide through to delete",
                      style: TextStyle(color: Color.fromARGB(255, 0, 128, 255)),
                    ),
                  ],
                ),
              ));
            },
            backgroundColor: const Color(0xFFFE4A49), 
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              _showSpendEditForm(context, spend);
            },
            // onPressed: (context) {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (ctx) => EditSpendCard(spend)));
            // },
            backgroundColor: const Color.fromARGB(255, 96, 150, 249),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),

      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 165, 204, 255),
          child: FaIcon(
            FontAwesomeIcons.featherPointed,
            size: 20.0,
            color: Color.fromARGB(255, 5, 61, 135),
          ),
        ),
        title: Text(
          spend.name,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
            "${spend.notes} + ${spend.category?.name.toString()} + ${spend.wallet?.name.toString()}"),
        trailing: Text(
          spend.getAmount,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
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
    return SpendList(spends: spends);
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
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: spends.length,
                itemBuilder: (BuildContext context, int index) {
                  return SpendItem(spends[index]);
                }))
      ],
    );
  }
}
