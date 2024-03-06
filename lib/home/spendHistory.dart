import "package:app/home/spends.dart";
import "package:flutter/material.dart";

class SpendsPage extends StatelessWidget {
  const SpendsPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Spend History"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Spends(),
          ),
        ],
      ),
    );
  }
}
