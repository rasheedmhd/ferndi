import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:realm/realm.dart";

class SpendItem extends StatelessWidget {
  const SpendItem(this.spend, {super.key});

  final Spend spend;

//   @override
//   SpendItemState createState() => SpendItemState();
// }
// class SpendItemState extends State<SpendItem> {

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
          print("spend deleted from sliding through");
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              deleteSpend(spend);
              print("deleted object from pressing delete");
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          // SlidableAction(
          //   onPressed: (context) {},
          //   backgroundColor: Color.fromARGB(255, 96, 150, 249),
          //   // backgroundColor: Color(0xFF21B7CA),
          //   foregroundColor: Colors.white,
          //   icon: Icons.edit,
          //   label: 'Edit',
          // ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      // endActionPane: const ActionPane(
      //   motion: ScrollMotion(),
      //   children: [
      //     SlidableAction(
      //       // An action can be bigger than the others.
      //       flex: 2,
      //       onPressed: doNothing,
      //       backgroundColor: Color(0xFF7BC043),
      //       foregroundColor: Colors.white,
      //       icon: Icons.archive,
      //       label: 'Archive',
      //     ),
      //     SlidableAction(
      //       onPressed: doNothing,
      //       backgroundColor: Color(0xFF0392CF),
      //       foregroundColor: Colors.white,
      //       icon: Icons.save,
      //       label: 'Save',
      //     ),
      //   ],
      // ),

      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.featherPointed,
          size: 30.0,
          color: Color.fromARGB(255, 5, 61, 135),
        ),
        title: Text(spend.name),
        subtitle: Text(spend.notes),
        trailing: Text(spend.amount),
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
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    //   child: SpendList(spends: spends()),
    // );
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
                itemCount: spends.length,
                itemBuilder: (BuildContext context, int index) {
                  return SpendItem(spends[index]);
                }))
      ],
    );
  }
}
