import "package:flutter/material.dart";
import "package:app/utility/schema/methods.dart";

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 35, 206, 135),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Current Balance",
                        ),
                        Row(
                          children: [
                            Text("GHS $balance",
                              style: const TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 5, 61, 135),
                              )),
                          ],
                        ),
                      ],
                    )
                    
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Income"),
                        Text(
                          "GHS ${income.balance}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 5, 61, 135),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Spend"),
                        Text(
                          "GHS ${totalSpend}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 5, 61, 135),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
