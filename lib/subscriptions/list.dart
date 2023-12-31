import "package:app/cards/subscriptions.dart";
import "package:flutter/material.dart";
import "package:app/cards/addSubscription.dart";


class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  SubscriptionsState createState() => SubscriptionsState();
}

class SubscriptionsState extends State<Subscriptions> {
  void _showSubscriptionForm() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context, 
      isScrollControlled: true,
      builder: (ctx) => const AddSubscriptionCard()
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Subscriptions",
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
            color: Colors.white,
            onPressed: _showSubscriptionForm, icon: const Icon(Icons.add))
          ],
          title: const Text("Subscriptions",  style: TextStyle(
              color: Colors.white
          ),),
          backgroundColor: const Color.fromARGB(255, 5, 61, 135),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Subscriptions",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 12,
            ),

            SizedBox(
              height: 700,
              child: 
              SubscriptionsCard()
            ),
          ]
        ),
      )
    );
  }
} 
