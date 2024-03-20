import "package:flutter/material.dart";
import 'package:app/models/schemas.dart' as my;
import "package:app/ops/update/editSubscription.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/subs_provider.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:intl/intl.dart";

class SubscriptionItem extends ConsumerWidget {
  const SubscriptionItem(this.subscription, {super.key});

  final my.Subscription subscription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dueDate =
        DateFormat("EEEE, dd MMMM, yyyy").format(subscription.createdAt);
    void showSubscriptionEditForm() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => EditSubscriptionCard(subscription),
        ),
      );
    }

    return Column(
      children: [
        Slidable(
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(subscription.id),

          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // A pane can dismiss the Slidable.
            dismissible: DismissiblePane(
              onDismissed: () {
                ref
                    .watch(subscriptionsNotifier.notifier)
                    .deleteSubscription(subscription);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 255, 231, 241),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Subscription Deleted.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 163, 9, 71),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
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
                    ),
                  );
                },
                foregroundColor: const Color(0xFFFE4A49),
                backgroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),

              SlidableAction(
                onPressed: (context) {
                  showSubscriptionEditForm();
                },
                foregroundColor: const Color.fromARGB(255, 96, 150, 249),
                backgroundColor: Colors.white,
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
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
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
                  const Text("Due Date: "),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            color: const Color.fromARGB(255, 234, 246, 255),
                            child: Text(
                              "$dueDate ",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 90, 90, 90),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            color: const Color.fromARGB(199, 71, 34, 255),
                            child: const Text(
                              " charge ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 227, 226, 226),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(" From ")),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${subscription.from}",
                        style: const TextStyle(
                          fontSize: 16.0,
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
                          child: const Text(" per ")),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class SubscriptionsCard extends ConsumerWidget {
  const SubscriptionsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subs = ref.watch(subscriptionsNotifier);
    return SubscriptionList(
      subscriptions: subs,
    );
  }
}

class SubscriptionList extends StatelessWidget {
  const SubscriptionList({super.key, required this.subscriptions});

  final List<my.Subscription> subscriptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (subscriptions.isEmpty)
          const Center(
            child: Text("You have no subscriptions yet!"),
          )
        else
          Flexible(
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: subscriptions.length,
              itemBuilder: (BuildContext context, int index) {
                return SubscriptionItem(subscriptions[index]);
              },
            ),
          ),
      ],
    );
  }
}
