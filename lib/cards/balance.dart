import "package:flutter/material.dart";

class balanceCard extends StatelessWidget {
  balanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10), child://)
    Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: const Padding(padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Text("Total Account balance"), 
                Text("GHS 120,000",
                  style: TextStyle(
                    fontSize: 33.0, 
                    fontWeight: FontWeight.w700, 
                    color: Color.fromARGB(255, 26, 114, 255),
                  )
                ), 
                Row(),
                Row(),
                Row(),
              ],
            )
            
          ))
        );
  }
}