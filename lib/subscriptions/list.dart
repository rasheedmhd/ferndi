import "package:flutter/material.dart";
import 'package:app/models/schemas.dart';
import "package:app/cards/addSubscription.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";


class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  SubscriptionsState createState() => SubscriptionsState();
}

class SubscriptionsState extends State<Subscriptions> {
  void _addSubscription() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const AddSubscriptionCard());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Subscriptions",
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: _addSubscription, icon: const Icon(Icons.add))
            ],
            title: const Text("Subscriptions",  style: TextStyle(
                color: Colors.white
            ),),
            backgroundColor: const Color.fromARGB(255, 5, 61, 135),
          ),
          body: Container(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: subscriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildSubscriptionCard(subscriptions[index]);
                }),
          ),
        ));
  }
} 

Widget _buildSubscriptionCard(Subscription subscriptionItem) {
  return Slidable(
          // Specify a key if the Slidable is dismissible.
      key: ValueKey(subscriptionItem),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          deleteSubscription(subscriptionItem);
          print("subscription deleted from sliding through");
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              deleteSubscription(subscriptionItem);
              print("subscription deleted object from pressing delete");
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
    child: Card (
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(
            children: [
              const Icon(
                Icons.account_balance_wallet,
                size: 20,
                color: Color.fromARGB(255, 17, 221, 106),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${subscriptionItem.from}",
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.subscriptions,
                size: 20,
                color: Color.fromARGB(255, 165, 64, 243),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                subscriptionItem.name,
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text("-",
                  style: TextStyle(
                    color: Color.fromARGB(255, 26, 114, 255),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(
                width: 5,
              ),
              const FaIcon(
                FontAwesomeIcons.cediSign,
                size: 20.0,
                color: Color.fromARGB(255, 26, 114, 255),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                subscriptionItem.amount,
                style: GoogleFonts.hankenGrotesk(
                  color: Color.fromARGB(255, 26, 114, 255),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  //fontFamily: "Galvji"
                ),
              ),
              Text(
                " /${subscriptionItem.period}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 148, 152, 158),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ]),
      )
    )
  );
}
