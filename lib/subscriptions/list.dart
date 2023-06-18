import "package:app/models/wallets.dart";
import "package:flutter/material.dart";
import "package:app/models/subscription.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

final List<Subscription> CurrentSubscriptions = [
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
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Row(
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  size: 25,
                  color: Color.fromARGB(255, 17, 221, 106),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  subscriptionItem.from,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.subscriptions,
                  size: 25,
                  color: Color.fromARGB(255, 165, 64, 243),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  subscriptionItem.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text(
                  "-",
                  style: TextStyle(
                    color: Color.fromARGB(255, 26, 114, 255),
                    fontSize: 33.0,
                    fontWeight: FontWeight.w700,
                  )
                ),
                const SizedBox(
                  width: 5,
                ),
                const FaIcon(FontAwesomeIcons.cediSign, size: 30.0, color: Color.fromARGB(255, 26, 114, 255),),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  subscriptionItem.getAmount,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 26, 114, 255),
                    fontSize: 33.0,
                    fontWeight: FontWeight.w700,
                    //fontFamily: "Galvji"
                  ),
                ),
                Text(
                  " /${subscriptionItem.period}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 148, 152, 158),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ]
        ),
      )
    );
  }

  void add_subscription() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Subscriptions",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("budget23 - Subscriptions"),
            backgroundColor: const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
          ),

// =========================================== if shit goes wrong uncomment this.
          body: Container(
            padding: const EdgeInsets.all(15.0),
            //color: Colors.amber,
            child: ListView.builder(
                itemCount: CurrentSubscriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return _BuildSubscriptionCard(CurrentSubscriptions[index]);
                  //return Text(_CurrentSubscriptions[index].name);
                }),
          ),
// =========================================== if shit goes wrong uncomment this.

// =========================================== experimentation

          // body: Column(children: <Widget>[
          //   //Padding(padding: padding)
          //   Container(child: Text("Hi, from inside container")),
          //   Text("Hi"),
          //   //Container(
          //   //padding: EdgeInsets.all(15.0),
          //   //color: Colors.amber,
          //   //child:
          //   ListView.builder(
          //       itemCount: _CurrentSubscriptions.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return _BuildSubscriptionCard(_CurrentSubscriptions[index]);
          //         //return Text(_CurrentSubscriptions[index].name);
          //       }),
          // //),
          // ],)

// =========================================== if shit goes wrong uncomment this.
        ));
  }
}
