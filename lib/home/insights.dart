import "package:app/Insights/cards/delightful.dart";
import "package:app/Insights/cards/spends.dart";
import "package:app/home/spendHistory.dart";
import "package:app/providers/spends_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

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
// - this year
// - since you joined
// Icon
// number
// button to add categories

// category  with the highest number of spends
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
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Insights> {
  @override
  Widget build(BuildContext context) {
    final spendsCount = ref.watch(spendsCountProvider);
    return ListView(padding: const EdgeInsets.all(15), children: [
      const DelightfulCard(),
      const SizedBox(
        height: 10,
      ),
      const Row(
       children: [
          SpendInfoCard(),
          SizedBox(
            width: 20,
          ),        
          SpendInfoCard(),
          SizedBox(
            width: 20,
          ),        
          SpendInfoCard(),
        ], 
      ),
      const SizedBox(
        height: 20,
      ),
      GestureDetector(
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SpendsPage()))
        },
        child: Row(
          children: [
            const Text(
              "Spend History",
              style: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 5, 61, 135),
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            const FaIcon(FontAwesomeIcons.arrowRightLong,
                size: 23, color: Color.fromARGB(255, 151, 151, 151)),
            Text(
              " $spendsCount ",
              style: const TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 151, 151, 151),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
