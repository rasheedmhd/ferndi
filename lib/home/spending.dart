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

  // @override
  // HomeState createState() => HomeState();
// }

// class HomeState extends ConsumerState<Spending> {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalSpend = ref.watch(spendsCountNotifier);
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        // const BalanceCard(),
        const SizedBox(
          height: 10,
        ),
        const AddSpendCard(),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SpendsPage()))
          },
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
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 2800,
          child: Spends(),
        ),
      ]);
  }
}