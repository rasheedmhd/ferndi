import "package:flutter/material.dart";

class NewPageCard extends StatefulWidget {
  const NewPageCard({super.key});

  @override
  NewPageCardState createState() => NewPageCardState();
}

class NewPageCardState extends State<NewPageCard> {
  
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
                "New Page",
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
