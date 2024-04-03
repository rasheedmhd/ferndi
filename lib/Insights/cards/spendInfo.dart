import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";


class SpendInfoCard extends StatelessWidget {

  const SpendInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 227, 226, 226),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 246, 220, 236),
              child: FaIcon(
                FontAwesomeIcons.featherPointed,
                size: 20.0,
                color: Color.fromARGB(255, 255, 0, 93),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("56",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 12, 12, 12),
                  )
                ),
                Text("Starts here!",
                  style: TextStyle(
                    // fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 12, 12, 12),
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
