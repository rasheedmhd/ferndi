import "package:app/Insights/cards/delightful.dart";
import 'package:app/Insights/cards/spendInfo.dart';
import 'package:app/Insights/Categories.dart';
import 'package:app/Insights/cards/spendsInfoCard.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/categories_provider.dart";
import "package:app/providers/spends_provider.dart";
import "package:app/providers/wallets_provider.dart";
// Cards

// Smart Card
// First Card gives you useful information


// category with the highest number of spends
// Icon
// number

// wallet with the highest number of spends
// Icon
// number

// Category with the most expensive spend
// Icon
// number
// button to add category

// Wallet with the most expensive spend
// Icon
// number
// button to add categories

// Streak

// [[ TO DO ]]
// Spends Average Amount
// Spends Smallest Amount
// Most Expensive Spends  Amount
// Most Expensive Spends  Wallet
// Most Spent from Wallet

class Insights extends ConsumerStatefulWidget {
  const Insights({super.key});

  @override
  InsightsState createState() => InsightsState();
}

class InsightsState extends ConsumerState<Insights> {
  @override
  Widget build(BuildContext context) {
    
    final categoriesCount = ref.watch(categoriesNotifier).length;
    final walletsCount = ref.watch(walletsNotifier).length;
    final totalSpend = ref.watch(spendsNotifier).length;


    return ListView(
      padding: const EdgeInsets.all(15),
      children: [

        const DelightfulCard(),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: SpendInfoCard2(),
        ),

        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Categories(),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 227, 226, 226),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "All Categories",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 5, 61, 135),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      " $categoriesCount ",
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              SpendInfoCard("Spends", totalSpend),
              const Spacer(),
              SpendInfoCard("Categories", categoriesCount),
              const Spacer(),
              SpendInfoCard("Wallets", walletsCount),
            ],
          ),
        ),
      ],
    );
  }
}
