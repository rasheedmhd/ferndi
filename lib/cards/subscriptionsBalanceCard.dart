import "package:flutter/material.dart";
import "package:app/utility/schema/methods.dart";

class SubscriptionsBalanceCard extends StatelessWidget {
  const SubscriptionsBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
        border: Border(
          bottom:
              BorderSide(width: 3.0, color: Color.fromARGB(255, 5, 61, 135)),
          right:
              BorderSide(width: 3.0, color: Color.fromARGB(255, 5, 61, 135)),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)
      )
    ),
    child: Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("    Total",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                )),
            Row(
              children: [
                Text("  GHS $subBalance",
                  style: const TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 5, 61, 135),
                )),
                const Text(".00",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Color.fromARGB(255, 202, 233, 255),
                )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "monthly",
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 61, 135),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                        "GHS $totalMonthlySubscriptionsBalance",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 5, 61, 135),
                        ),
                        ),
                        const Text(".00",
                          style: TextStyle(
                            color: Color.fromARGB(255, 202, 233, 255),
                          )),
                          ],
                        )
                      ],
                    ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "yearly",
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 61, 135),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "GHS $totalYearlySubscriptionsBalance",
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 5, 61, 135),
                                ),
                              ),
                              const Text(".00",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 202, 233, 255),
                                  )),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "one time",
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 61, 135),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "GHS $totalOneTimeSubscriptionsBalance",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 5, 61, 135),
                                ),
                              ),
                              const Text(".00",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 202, 233, 255),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
