import "package:flutter/material.dart";
import "package:app/utility/schema/methods.dart";

class SubscriptionsBalanceCard extends StatelessWidget {
  const SubscriptionsBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Total Money Spent on Subscriptions"),
                    Text("GHS $subBalance",
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 5, 61, 135),
                      )
                    ),
                  ],
                )
              ],
            ),
            Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Monthly"),
                        Text("GHS $totalMonthlySubscriptionsBalance", 
                          style: const TextStyle(fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 5, 61, 135),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Yearly"),
                        Text(
                          "GHS $totalYearlySubscriptionsBalance", 
                          style: const TextStyle(
                            fontWeight: FontWeight.w700, 
                            color: Color.fromARGB(255, 5, 61, 135),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("One time"),
                        Text(
                          "GHS $totalOneTimeSubscriptionsBalance", 
                          style: const TextStyle(
                            fontWeight: FontWeight.w700, 
                            color: Color.fromARGB(255, 5, 61, 135),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
