import "package:flutter/material.dart";
import "package:app/budgets/budgets.dart";
import "package:app/savings/savings.dart";
import "package:google_fonts/google_fonts.dart";

class Savings extends StatelessWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Savings",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("budget23 - Savings"),
          backgroundColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
        ),
        
        body: Container(
          child: Column(
            children: [
              Text("Savings"),
                Text("save",),
                Text("save"),
                Text("save"),
                Text("save"),

                Text("Add Savings +")
            ],
          ),
        )
      ),
    );
  }
}

