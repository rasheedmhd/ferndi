import "package:flutter/material.dart";
import 'package:app/models/schemas.dart' as my;
import "package:app/utility/schema/methods.dart";
import "package:app/ops/update/editSubscription.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:realm/realm.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class SubscriptionItem extends StatelessWidget {
  const SubscriptionItem(this.subscription, {super.key});

  final my.Subscription subscription;

  void _showSubscriptionEditForm(
      BuildContext context, my.Subscription subscription) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => EditSubscriptionCard(subscription)));
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
          deleteSubscription(subscription);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color.fromARGB(255, 255, 231, 241),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Subscription Deleted.",
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
                      "Please slide through to delete Subscription.",
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
              _showSubscriptionEditForm(context, subscription);
            },
            backgroundColor: const Color.fromARGB(255, 96, 150, 249),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 215, 237, 253),
                    child: FaIcon(
                      FontAwesomeIcons.solidCreditCard,
                      size: 20,
                      color: Color.fromARGB(255, 5, 61, 135),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    subscription.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "- GHS ${subscription.getAmount}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 163, 9, 71),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
            Row(children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 227, 226, 226),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(" From ")
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${subscription.from}",
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 227, 226, 226),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(" per ")
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                " ${subscription.period}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 148, 152, 158),
                  fontSize: 17.0,
                ),
              ),

            ],),
            ]),
        )
      ),
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
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: subscriptions.length,
        itemBuilder: (BuildContext context, int index) {
          return SubscriptionItem(subscriptions[index]);
        });
  }
}
