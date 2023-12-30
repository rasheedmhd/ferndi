import "package:flutter/material.dart";
import "package:app/subscriptions/list.dart";
// import "package:app/budgets/budgets.dart";
import 'package:app/accounts/accounts.dart';
import "package:app/home/home.dart";

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() {
    return _NavigationScreenState();
  }
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const Home();

    switch (_selectedPageIndex) {
      // case 1:
      //   activePage = const Budgets();
      case 1:
        activePage = const Subscriptions();
      case 2:
        activePage = const Accounts();
    }

    return MaterialApp(
      // theme: theme,
      theme: ThemeData(fontFamily: 'Gilroy'),
      title: "ferndi - Budgeting App",
      home: Scaffold(
        // appBar: AppBar(
        //   // Dynamically changed based on the screen loaded by
        //   // the navigation
        //   title: Text(activePageTitle),
        // ),
        // Dynamically loaded based on the screen selected from
        // the bottom navigation
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: "Spending",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.currency_bitcoin),
            //   label: "Budget",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership_sharp),
              label: "Subscriptions",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: "Accounts",
            ),
          ],
          
          selectedItemColor: const Color.fromARGB(255, 5, 61, 135),
          unselectedItemColor: const Color.fromARGB(255, 26, 114, 255),
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
        ),
      ),
    );
  }
}