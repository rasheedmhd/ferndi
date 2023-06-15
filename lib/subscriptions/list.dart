import "package:flutter/material.dart";

late List<num> _TotalWalletAmount = [];



class Subscriptions extends StatelessWidget {
  const Subscriptions({super.key});


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
            child: Column(
              children: [
                Text("Total money spent on subscriptions"),
                Text(
                  "ih",
                ),
                Text("ih"),
                Text("ih"),
                Text("ih"),
                Text("ih"),
                Text("ih"),
              ],
            ),
          )),
    );
  }
}
