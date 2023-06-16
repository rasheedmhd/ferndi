import "package:app/models/wallets.dart";
import "package:flutter/material.dart";
import "package:app/models/subscription.dart";

final List<Subscription> _CurrentSubscriptions = [
  Subscription(
    name: "Spotify",
    amount: 27,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Month,
  ),
  Subscription(
    name: "Google One",
    amount: 13,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Month,
  ),
  Subscription(
    name: "Calculator",
    amount: 20,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Year,
  ),
  Subscription(
    name: "Netflix",
    amount: 33,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Month,
  ),
  Subscription(
    name: "Apple Music",
    amount: 71,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Year,
  ),
];

class Subscriptions extends StatelessWidget {
  const Subscriptions({super.key});

  Widget _BuildSubscriptionCard(Subscription subscriptionItem) {
    return Card(
        //elevation: 1.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        //margin: const EdgeInsets.symmetric(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Text(
              subscriptionItem.wallet.toString(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subscriptionItem.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  "\-GHS ${subscriptionItem.amount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 26, 114, 255),
                    fontSize: 33.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " \/${subscriptionItem.duration.toString()}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 148, 152, 158),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ]),
        ));
  }

  void add_sub() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Subscriptions",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("budget23 - Subscriptions"),
            backgroundColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
          ),
          body: Container(
            padding: EdgeInsets.all(15.0),
            //color: Colors.amber,
            child: ListView.builder(
                itemCount: _CurrentSubscriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return _BuildSubscriptionCard(_CurrentSubscriptions[index]);
                  //return Text(_CurrentSubscriptions[index].name);
                }),
          ),
        ));
  }
}
