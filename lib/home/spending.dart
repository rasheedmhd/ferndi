import "package:app/home/spendHistory.dart";
import "package:app/home/spends.dart";
import "package:app/providers/spends_provider.dart";
import "package:flutter/material.dart";
import "package:app/cards/balance.dart"; 
import "package:app/ops/create/addSpend.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class Spending extends ConsumerWidget {
  const Spending({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalSpend = ref.watch(spendsNotifier).length;
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const BalanceCard(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: AddSpendCard(),
        ),   
        GestureDetector(
          onTap: () => 
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SpendsPage())
              ),
          child: Row(
            children: [
              const Text(
                "Spend History",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                ),
              ),
              const Spacer(),
              const FaIcon(FontAwesomeIcons.arrowRightLong,
                  size: 23, color: Color.fromARGB(255, 151, 151, 151)),
              Text(
                " $totalSpend ",
                style: const TextStyle(
                  fontSize: 30.0,
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
      ]);
  }
}