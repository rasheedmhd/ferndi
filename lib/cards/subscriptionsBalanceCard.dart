import "package:flutter/material.dart";
import "package:app/providers/subs_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SubscriptionsBalanceCard extends ConsumerWidget {
  const SubscriptionsBalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalSubsAmount = ref.watch(subBalance);

    final month     = ref.watch(getSub("month"));
    final year      = ref.watch(getSub("year"));
    final onetime   = ref.watch(getSub("one time"));


    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3.0,
            color: Color.fromARGB(255, 5, 61, 135),
          ),
          right: BorderSide(
            width: 3.0,
            color: Color.fromARGB(255, 5, 61, 135),
          ),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
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
              const Text(
                "    Total",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                ),
              ),
              Row(
                children: [
                  Text(
                    "  GHS $totalSubsAmount",
                    style: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 5, 61, 135),
                    ),
                  ),
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
                            "GHS $month",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 5, 61, 135),
                            ),
                          ),
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
                            "GHS $year",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 5, 61, 135),
                            ),
                          ),
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
                            "GHS $onetime",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color.fromARGB(255, 5, 61, 135),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
