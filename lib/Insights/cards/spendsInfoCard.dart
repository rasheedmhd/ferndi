import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:app/providers/spends_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SpendInfoCard2 extends ConsumerWidget {
  const SpendInfoCard2({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final all_spends = ref.watch(spendsCountProvider);
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
                      Text("$all_spends",
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                      const Text("this week",
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
                      Text("$all_spends",
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                      const Text("this month",
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
                      Text("$all_spends",
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                      const Text("all spends",
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
