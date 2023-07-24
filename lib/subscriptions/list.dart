import "package:flutter/material.dart";
import 'package:app/models/schemas.dart';
import "package:app/cards/addSubscription.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";

final List<_Subscription> CurrentSubscriptions = [
  _Subscription(
    name: "Spotify",
    amount: 27,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.month,
  ),
  _Subscription(
    name: "Google One",
    amount: 13,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Month,
  ),
  _Subscription(
    name: "Calculator",
    amount: 20,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Year,
  ),
  _Subscription(
    name: "Netflix",
    amount: 33,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Month,
  ),
  _Subscription(
    name: "Apple Music",
    amount: 71,
    wallet: Wallet.AccessDebitCard,
    duration: Duration.Year,
  ),
];

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
            title: const Text("Track Subscriptions"),
            backgroundColor: const Color.fromARGB(255, 26, 114, 255),
          ),
          body: Container(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: CurrentSubscriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return _BuildSubscriptionCard(CurrentSubscriptions[index]);
                }),
          ),
        ));
  }
}

Widget _BuildSubscriptionCard(Subscription subscriptionItem) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(20),
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
                subscriptionItem.from,
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
                subscriptionItem.getAmount,
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
      ));
}
