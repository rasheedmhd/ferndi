import "package:flutter/material.dart";

class SpendInfoCard extends StatelessWidget {
  const SpendInfoCard(this.title, this.value, {super.key});
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 227, 226, 226),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value.toString(),
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Color.fromARGB(255, 12, 12, 12),
                    )),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 12, 12, 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
