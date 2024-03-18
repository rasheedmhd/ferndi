import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:app/providers/spends_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SpendInfoCard2 extends ConsumerWidget {
  const SpendInfoCard2({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final now          = DateTime.now();
    final weekday      = ref.watch(filterSpendsWeek(now)).length;
    final prevWeekday  = ref.watch(filterSpendsWeek(now.subtract(const Duration(days: 7)))).length;
    final month        = ref.watch(filterSpends(now)).length;
    DateTime prevMonth = DateTime(now.year, now.month - 1, now.day);
    // Handle edge case when previous month is in the previous year
    if (prevMonth.month == 12 && now.month == 1) {
      prevMonth = DateTime(now.year - 1, 12, now.day);
    }
    final previousMonth = ref.watch(filterSpends(prevMonth)).length;
    final allTime = ref.watch(spendsNotifier).length;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 227, 226, 226),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Spending Insights",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10,
            color: Color.fromARGB(255, 227, 226, 226),
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
                  if ( weekday > prevWeekday )
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 246, 220, 236),
                    child: FaIcon(
                      FontAwesomeIcons.arrowUp,
                      size: 20.0,
                      color: Color.fromARGB(255, 255, 0, 93),
                    ),
                  )
                  else
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 220, 246, 246),
                    child: FaIcon(
                      FontAwesomeIcons.arrowDown,
                      size: 20.0,
                      color: Color.fromARGB(255, 35, 206, 135),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$weekday",
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                      const Text("This Weekday",
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (month > previousMonth )
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 246, 220, 236),
                      child: FaIcon(
                        FontAwesomeIcons.arrowUp,
                        size: 20.0,
                        color: Color.fromARGB(255, 255, 0, 93),
                      ),
                    )
                  else                  
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 220, 246, 246),
                    child: FaIcon(
                      FontAwesomeIcons.arrowDown,
                      size: 20.0,
                      color: Color.fromARGB(255, 35, 206, 135),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$month",
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                      const Text("This Month",
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 246, 220, 236),
                    child: FaIcon(
                      FontAwesomeIcons.arrowUp,
                      size: 20.0,
                      color: Color.fromARGB(255, 255, 0, 93),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$allTime",
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                      const Text("All Spends",
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
