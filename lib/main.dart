import "package:app/subscriptions/list.dart";
import "package:flutter/material.dart";
import "subscriptions/list.dart";
import "budgets/budgets.dart";
import "savings/savings.dart";
import "package:google_fonts/google_fonts.dart";

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.dmSansTextTheme(),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: "budge23",
      //home: Savings(),
      // home: Subscriptions(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("budget23", style: TextStyle(color: Colors.white),),
          backgroundColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
        ),
        body: const Center(
          child: Text("Hello, World"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_bitcoin),
              label: "Budget",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments),
              label: "Spending",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Subscriptions",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: "Profile",
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 5, 61, 135),
          unselectedItemColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
          onTap: (index) {},
        ),
     ),
    );
  }
}
