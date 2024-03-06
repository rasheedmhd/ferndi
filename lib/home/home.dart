import "package:app/home/insights.dart";
import "package:app/home/spending.dart";
import "package:app/ops/create/addSpend.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  void addSpend() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const AddSpendCard(),
    );
  }

    DateTime date = DateTime.now();

  Future<void> setDatePicker() async {
    DateTime? setDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (setDate != null) {
      setState(() {
        date = setDate;
      });
    } else {
      date = DateTime.now();
    }
  }

  void newDate(String typedDate) {
    date = DateTime.parse(typedDate);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.chevronLeft,
                      size: 20, color: Colors.white),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: setDatePicker,
                    child: const Text(
                      "This Month",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const FaIcon(FontAwesomeIcons.chevronRight,
                      size: 20, color: Colors.white),
                ],
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 5, 61, 135),
        ),
        floatingActionButton: CircleAvatar(
          radius: 25,
          child: FloatingActionButton(
            elevation: 1,
            heroTag: "addSpend",
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            backgroundColor: const Color.fromARGB(255, 35, 206, 135),
            onPressed: addSpend,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        body: const Column(
          children: [
            TabBar(
              dividerColor: Color.fromARGB(255, 255, 255, 255),
              indicatorColor: Color.fromARGB(255, 5, 61, 135),
              indicatorWeight: 4,
              splashBorderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
