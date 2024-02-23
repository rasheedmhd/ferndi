import "package:flutter/material.dart";
import "package:app/providers/subs_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SubscriptionsBalanceCard extends ConsumerWidget {
  const SubscriptionsBalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final subBalance = ref.watch(subscriptions)
      .value?.
      results
      .toList()
      .map((subscription) => subscription.amount)
      .toList()
      .fold(0, (value, element) => value + element);

    // final totalMonthlySubscriptionsBalance = ref.watch(subscriptions)
    //     // .query<Subscription>('duration.name == \$0', ['month'])
    //     // .toList()
    //     .value?.results.
    //     map((sub) => (sub.duration!.name == "month"))
    //     // .toList()
    //     .map((subByDur) => (subByDur.amount))
    //     .toList()
    //     .fold(0, (value, element) => value + element);

    final month = ref
        .watch(subscriptionsNotifier.notifier)
        .totalMonthlySubscriptionsBalance;
    final year = ref
        .watch(subscriptionsNotifier.notifier)
        .totalYearlySubscriptionsBalance;
    final onetime = ref
        .watch(subscriptionsNotifier.notifier)
        .totalOneTimeSubscriptionsBalance;

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
                    "  GHS $subBalance",
                    style: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 5, 61, 135),
                    ),
                  ),
                  const Text(
                    ".00",
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Color.fromARGB(255, 202, 233, 255),
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
                          const Text(
                            ".00",
                            style: TextStyle(
                              color: Color.fromARGB(255, 202, 233, 255),
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
                            "GHS $onetime",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color.fromARGB(255, 5, 61, 135),
                            ),
                          ),
                          const Text(
                            ".00",
                            style: TextStyle(
                              color: Color.fromARGB(255, 202, 233, 255),
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
