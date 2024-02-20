import "package:app/Insights/cards/delightful.dart";
import 'package:app/Insights/cards/spendInfo.dart';
import 'package:app/Insights/Categories.dart';
import 'package:app/Insights/cards/spendsInfoCard.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/categories_provider.dart";

// import "package:flutter_riverpod/flutter_riverpod.dart";

// Cards

// Smart Card
// First Card gives you useful information

// Buttons
// total categories
// Icon
// number
// button to see all categories
// button to add categories

// total spends
// 4 in a row
// - this week
// - this month
// - all spends
// - since you joined
// Icon
// number
// button to add categories

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

// total wallets
// Icon
// number
// button to add wallet

// Streak

class Insights extends ConsumerStatefulWidget {
  const Insights({super.key});

  @override
  InsightsState createState() => InsightsState();
}

class InsightsState extends ConsumerState<Insights> {
  @override
  Widget build(BuildContext context) {
    
    final categoriesCount = ref.watch(categoriesNotifier).length;

    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const DelightfulCard(),
        const SizedBox(
          height: 20,
        ),
        const SpendInfoCard2(),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Categories(),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
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
                      "All categories",
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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpendInfoCard(),
              SpendInfoCard(),
              SpendInfoCard(),
            ],
          ),
        ),
      ],
    );
  }
}
