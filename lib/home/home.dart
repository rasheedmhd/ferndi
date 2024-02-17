import "package:app/home/insights.dart";
import "package:app/home/spending.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.chevronLeft,
                      size: 20, color: Colors.white),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "This Month",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FaIcon(FontAwesomeIcons.chevronRight,
                      size: 20, color: Colors.white),
                ],
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 5, 61, 135),
        ),
        body: const Column(
          children: [
            TabBar(
              dividerColor: Color.fromARGB(255, 255, 255, 255),
              indicatorColor: Color.fromARGB(255, 5, 61, 135),
              indicatorWeight: 4,
              splashBorderRadius: BorderRadius.all(Radius.circular(50)),
              labelColor: Color.fromARGB(255, 5, 61, 135),
              tabs: [
                Tab(
                  text: "Spending",
                ),
                Tab(
                  text: "Insights",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Spending(),
                  Insights(),
                ]
              )
            )
          ])
        )
      );
  }
}
