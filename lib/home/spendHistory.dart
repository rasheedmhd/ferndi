import "package:app/home/allSpends.dart";
import "package:flutter/material.dart";
import "package:app/providers/spends_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


class SpendsPage extends ConsumerWidget {
  const SpendsPage({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

  void showFilters() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const Text("Hello"),
    );
  }
    final totalSpend = ref.watch(spendsNotifier).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Spend History"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        children:  [
          Row(
            children: [
              Text(
                " $totalSpend ",
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 151, 151, 151),
                ),
              ),              
              const Text(
                "Total Spends",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                ),
              ),
              // const Spacer(),
              // GestureDetector(
              //   onTap: showFilters,
              //   child: const Text(
              //     "Filter",
              //     style: TextStyle(color: Color.fromARGB(255, 31, 80, 255)),
              //   ),
              // ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: allSpends(),
          ),
        ],
      ),
    );
  }
}
