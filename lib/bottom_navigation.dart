import "package:flutter/material.dart";

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() {
    return NavigationScreenState();
  }
}

class NavigationScreenState extends State<NavigationScreen> {
  int _currentPageIndex = 0;

  void _currentPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget activePage = const SpendingScreen();
    // String activePageTitle = "Spending";
    
    
    // if (_currentPage == 1) {
    //   activePage = BudgetScreen();
    //   activePageTitle = "Budgets";
    // }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(activePageTitle),
      // ),
      // body: ..,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Spending",),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Budget",),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Subscriptions",),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Profile",),
        ],
      ), 
    );
  }
}
