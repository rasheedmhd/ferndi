import "package:flutter/material.dart";

class HistoryInfoCard extends StatelessWidget {
  const HistoryInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 227, 226, 226),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Scaffold(
        bottomSheet: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 227, 226, 226),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Spend History",
                style: TextStyle(
                    fontSize: 30.0, color: Color.fromARGB(255, 5, 61, 135)),
              ),
              SizedBox(
                height: 10,
              ),
              Text("This is a list of all your Spends recorded within this month"),
              Text("To view all your Spends recorded since you started using Ferndi, click on View all at the right"),
            ],
          ),
        ),
      ),
    );
  }
}
