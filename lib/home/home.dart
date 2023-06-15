import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Budgets",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("budget23 - Record Spend"),
          backgroundColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
        ),
        
        body: Container(
          child: Column(
            children: [
                Text("What did you buy?"),
                Text("Name"),
                Text("Amount",),
                Text("description"),
                Text("Wallet Spent from"),
                Text("record"),

                Text("Recents Spendings"),
            ],
          ),
        )
      ),
    );
  }
}

