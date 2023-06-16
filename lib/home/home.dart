import "package:flutter/material.dart";
// import "package:app/cards/spendTracker.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // TODO: add state variables and functions

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Budgets",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("budget23 - Record and Track spends"),
            backgroundColor: const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
          ),
          body: const Center(
            child: Column(
              children: [
                Text("What did you buy?", style: TextStyle(color: Colors.red)),
                Text("Name"),
                Text(
                  "Amount",
                ),
                Text("description"),
                Text("Wallet Spent from"),
                Text("record"),
                Text("Recents Spendings"),
                Text("Spending History"),
              ],
            ),
          )),
    );
  }
}
