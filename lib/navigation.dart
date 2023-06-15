import "package:flutter/material.dart";
import "package:app/subscriptions/list.dart";
import "package:app/budgets/budgets.dart";
import "package:app/savings/savings.dart";
import "package:app/home/home.dart";

import "package:google_fonts/google_fonts.dart";

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.dmSansTextTheme(),
);

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
    // setState(index) => (_currentPageIndex = index);
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const Home();

    // if (_selectedPageIndex == 2) {
    //   activePage = Savings();
    //   activePageTitle = "Savings";
    // }

    switch (_selectedPageIndex) {
      case 1:
        activePage = Budgets();
      case 2:
        activePage = Subscriptions();
      case 3:
        activePage = Savings();
    }

    return MaterialApp(
      theme: theme,
      title: "budget23 - Budgeting App",
      // home: NavigationScreen(),
      //home: Subscriptions(),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_bitcoin),
              label: "Budget",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Subscriptions",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: "Savings",
            ),
          ],
          
          selectedItemColor: Color.fromARGB(255, 5, 61, 135),
          unselectedItemColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
        ),
      ),
    );
  }
}

// class Nav extends StatelessWidget {
//   const Nav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.payments),
//             label: "Spending",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.currency_bitcoin),
//             label: "Budget",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.payment),
//             label: "Subscriptions",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_balance),
//             label: "Profile",
//           ),
//         ],
//         selectedItemColor: Color.fromARGB(255, 5, 61, 135),
//         unselectedItemColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
//         onTap: (index) {},
//       ),
//     );
//   }
// }
