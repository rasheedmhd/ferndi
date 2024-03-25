import "package:app/cards/subscriptions.dart";
import "package:app/cards/subsBalanceCard.dart";
import "package:flutter/material.dart";
import "package:app/ops/create/addSubscription.dart";

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  SubscriptionsState createState() => SubscriptionsState();
}

class SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    void showSubscriptionForm() {
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) => const AddSubscriptionCard(),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: showSubscriptionForm,
            icon: const Icon(
              Icons.add,
              size: 34,
              color: Color.fromARGB(255, 5, 61, 135),
            ),
          )
        ],
        title: const Text(
          "Subscriptions",
          style: TextStyle(color: Color.fromARGB(255, 5, 61, 135)),
        ),
        backgroundColor: const Color.fromARGB(255, 234, 246, 255),
      ),
      body: Container(
        color: const Color.fromARGB(255, 234, 246, 255),
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubscriptionsBalanceCard(),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Your Subscriptions",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: SubscriptionsCard(),
            ),   
          ],
        ),
      ),
    );
  }
}
