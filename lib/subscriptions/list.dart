import "package:app/cards/subscriptions.dart";
import "package:app/cards/subscriptionsBalanceCard.dart";
import "package:flutter/material.dart";
import "package:app/ops/create/addSubscription.dart";


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

            onPressed: _showSubscriptionForm, icon: const Icon(
              Icons.add, 
              size: 34, 
              color: Color.fromARGB(255, 5, 61, 135),
              )
            )

          ],
          title: const Text("Subscriptions",  style: TextStyle(
              color: Color.fromARGB(255, 5, 61, 135)
          ),),
          backgroundColor: const Color.fromARGB(255, 202, 233, 255),
        ),
        body: Container(
          color: const Color.fromARGB(255, 215, 237, 253),
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
          
              SizedBox(
                height: 2800,
                child: 
                SubscriptionsCard()
              ),
            ]
          ),
        ),
      )
    );
  }
} 
