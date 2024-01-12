import "package:flutter/material.dart";

class TransferCard extends StatefulWidget {
  const TransferCard({super.key});

  @override
  TransferCardState createState() => TransferCardState();
}

class TransferCardState extends State<TransferCard> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding:  EdgeInsets.fromLTRB(30, 60, 30, 30),
        child: Column(
          children: [
              Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Transfer",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}
