import "package:flutter/material.dart";
import 'package:app/models/schemas.dart' as my;
import "package:app/utility/schema/methods.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:realm/realm.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class SubscriptionItem extends StatelessWidget {
  const SubscriptionItem(this.subscription, {super.key});

  final my.Subscription subscription;

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
            deleteSubscription(subscription);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Color.fromARGB(255, 255, 231, 241),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Subscription Deleted.",
                    style: TextStyle(
                        color: Color.fromARGB(255, 163, 9, 71)),
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
                      "Please slide through to delete Subscription.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 255)),
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
                Icons.wallet_sharp,
                size: 20,
                color: Color.fromARGB(255, 17, 221, 163),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${subscription.from}",
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
                Icons.card_membership,
                size: 20,
                color: Color.fromARGB(255, 165, 64, 243),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                subscription.name,
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
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                )),
              const SizedBox(
                width: 5,
              ),
              const FaIcon(
                FontAwesomeIcons.cediSign,
                size: 17.0,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                subscription.getAmount,
              ),
              Text(
                " / ${subscription.period}",
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
}

class SubscriptionsCard extends StatelessWidget {
  const SubscriptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SubscriptionList(
      subscriptions: subscriptions,
    );
  }
}

class SubscriptionList extends StatelessWidget {
  const SubscriptionList({super.key, required this.subscriptions});

  final RealmResults<my.Subscription> subscriptions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subscriptions.length,
      itemBuilder: (BuildContext context, int index) {
        return SubscriptionItem(subscriptions[index]);
      });
  }
}
