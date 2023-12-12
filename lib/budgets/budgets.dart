import "package:flutter/material.dart";

class Budgets extends StatelessWidget {
  const Budgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Budgets",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Budgets", style: TextStyle(
                color: Colors.white
            ),),
          backgroundColor: const Color.fromARGB(255, 5, 61, 135),
        ),
        
        body: Container(
          child: const Column(
            children: [
              Text(
                "Wallets",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                  fontWeight: FontWeight.w700,
                  // fontFamily: "WorkSans"
                ),
              ),
            SizedBox(
              height: 12,
            ),

            Divider(),

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

