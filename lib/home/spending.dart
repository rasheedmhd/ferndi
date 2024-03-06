import "package:app/home/spendHistory.dart";
import "package:app/home/spends.dart";
import "package:flutter/material.dart";
import "package:app/cards/balance.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class Spending extends ConsumerWidget {
  const Spending({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const BalanceCard(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          // child: AddSpendCard(),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SpendsPage(),
            ),
          ),
          child: const Row(
            children: [
              Text(
                "Spend History",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                ),
              ),
              Spacer(),
              Text(
                "View all",
                style: TextStyle(
                  color: Color.fromARGB(255, 151, 151, 151),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Spends(),
        ),
      ],
    );
  }
}
