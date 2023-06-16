import "package:flutter/material.dart";

class Budgets extends StatelessWidget {
  const Budgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Budgets",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("budget23 - Budgets"),
          backgroundColor: const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
        ),
        
        body: Container(
          child: const Column(
            children: [
                Text("Where you spend from"),
                Text("Budget"),
                Text("macbook",),
                Text("drone"),
                Text("job"),
                Text("ps5"),

                Text("Create New Budget"),
            ],
          ),
        )
      ),
    );
  }
}

