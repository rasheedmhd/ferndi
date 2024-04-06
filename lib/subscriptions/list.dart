import "package:app/cards/subscriptions.dart";
import "package:app/cards/subsBalanceCard.dart";
import "package:flutter/material.dart";
import "package:app/ops/create/addSubscription.dart";

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  SubscriptionsState createState() => SubscriptionsState();
}

// [[ TO DO ]]
// Automatic subscriptions charging
// import 'package:realm/realm.dart';

// _Subscription createMonthlySubscription({
//   required String name,
//   required int amount,
//   required DateTime createdAt,
//   required DateTime chargeAt,
//   _Duration? duration,
//   _Wallet? wallet,
// }) {
//   // Calculate the next chargeAt date
//   DateTime nextChargeAt = DateTime(
//     chargeAt.year + ((chargeAt.month + 1) ~/ 12), // Increment year if necessary
//     (chargeAt.month + 1) % 12, // Increment month, wrapping around to 1 if December
//     chargeAt.day, // Preserve the day
//     chargeAt.hour, // Preserve the hour
//     chargeAt.minute, // Preserve the minute
//     chargeAt.second, // Preserve the second
//   );

//   // Create and return a new _Subscription object
//   return _Subscription()
//     ..id = ObjectId() // Generate a new ObjectId
//     ..name = name
//     ..amount = amount
//     ..createdAt = createdAt
//     ..chargeAt = nextChargeAt // Set the next chargeAt date
//     ..duration = duration
//     ..wallet = wallet;
// }

// void main() {
//   // Example usage:
//   DateTime now = DateTime.now();
  
//   // Assuming today is the createdAt date and the initial chargeAt date
//   DateTime createdAt = now;
//   DateTime initialChargeAt = DateTime(now.year, now.month, 10); // Assuming the 10th of the month
  
//   // Create a monthly subscription
//   _Subscription monthlySubscription = createMonthlySubscription(
//     name: 'Monthly Subscription',
//     amount: 50, // Example amount
//     createdAt: createdAt,
//     chargeAt: initialChargeAt,
//     // Optionally, provide duration and wallet parameters
//   );
  
//   print(monthlySubscription);
// }


class SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    void showSubscriptionForm() {
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) => const AddSubscriptionCard(),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: showSubscriptionForm,
            icon: const Icon(
              Icons.add,
              size: 34,
              color: Color.fromARGB(255, 5, 61, 135),
            ),
          )
        ],
        title: const Text(
          "Subscriptions",
          style: TextStyle(color: Color.fromARGB(255, 5, 61, 135)),
        ),
        backgroundColor: const Color.fromARGB(255, 234, 246, 255),
      ),
      body: Container(
        color: const Color.fromARGB(255, 234, 246, 255),
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubscriptionsBalanceCard(),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Your Subscriptions",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: SubscriptionsCard(),
            ),   
          ],
        ),
      ),
    );
  }
}
