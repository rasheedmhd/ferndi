import "package:flutter/material.dart";

class DelightfulCard extends StatelessWidget {
  const DelightfulCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(3.142 / 6),
          colors: [
            Color.fromARGB(255, 255, 42, 42),
            Color.fromARGB(255, 237, 211, 255),
          ]
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                Text("Delightful Spending",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )
                ),
                Text("Starts here!",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
