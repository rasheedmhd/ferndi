import "package:flutter/material.dart";

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

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
                "Current Balance",
                style: TextStyle(
                    fontSize: 30.0, color: Color.fromARGB(255, 5, 61, 135)),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Your Current Balance is a summation of all the balances of all of your Wallets."),
              Text("Your debt wallets (negative balances) are also included. This means that what you see includes deductions from you debt wallets"),
            ],
          ),
        ),
      ),
    );
  }
}
