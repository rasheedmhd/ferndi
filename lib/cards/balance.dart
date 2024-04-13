import "package:app/cards/info/info.dart";
import "package:flutter/material.dart";
import "package:app/providers/spends_provider.dart";
import "package:app/providers/wallets_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class BalanceCard extends ConsumerWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalSpend  = ref.watch(tb(DateTime.now()));
    final balance     = ref.watch(wb(DateTime.now()));
    final income      = ref.watch(pi(DateTime.now()));

    void showInfo() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => InfoCard(),
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(3.142 / 6),
            colors: [
              Color.fromARGB(255, 10, 16, 96),
              Color.fromARGB(255, 5, 61, 135),
              Color.fromARGB(255, 128, 183, 255),
            ]),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Current Balance  ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 228, 255, 239),
                          ),
                        ),
                        GestureDetector(
                          onTap: showInfo,
                          child: const FaIcon(
                            FontAwesomeIcons.circleQuestion,
                            size: 13,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "GHS ${balance.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Income",
                        style: TextStyle(
                          color: Color.fromARGB(255, 228, 255, 239),
                        )),
                    Text(
                      "GHS ${income.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
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
                    const Text("Spend",
                        style: TextStyle(
                          color: Color.fromARGB(255, 228, 255, 239),
                        )),
                    Text(
                      "GHS ${totalSpend.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
