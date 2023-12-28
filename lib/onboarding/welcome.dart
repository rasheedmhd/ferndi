import "package:app/cards/addSpend.dart";
import "package:app/cards/addIncome.dart";
import "package:app/utility/schema/methods.dart";
import "package:app/navigation.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ferndi",
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Onboarding"),
        ),
        body: PageView(
          children: [
            Container(
              color: Colors.white,
              child: const Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Welcome to ",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Ferndi",
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Color.fromARGB(255, 35, 206, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.moneyBillTransfer,
                            size: 30.0,
                            color: Color.fromARGB(255, 16, 212, 173),
                          ),
                          title: Text("TRACK YOUR SPENDS"),
                          subtitle: Text(
                              "Spend from your Wallets and record spends in real time like in real life."),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.subscriptions,
                            size: 30.0,
                            color: Color.fromARGB(255, 50, 163, 255),
                          ),
                          title: Text("TRACK YOUR SUBSCRIPTIONS"),
                          subtitle: Text(
                              "Know how much you spend on Subscriptions to empower your budgeting."),
                        ),
                        ListTile(
                          leading: FaIcon(
                            Icons.savings,
                            size: 30.0,
                            color: Color.fromARGB(255, 222, 121, 255),
                          ),
                          title: Text("SAVE AND GROW"),
                          subtitle: Text(
                              "A recommended savings Wallet to grow your wealth."),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Text("An opinionated way to manage your wealth."),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back),
                            Text("    swipe"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: const Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Setup your first",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Color.fromARGB(255, 35, 206, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Wallets are where you spend from."),
                        Text("You can add more Wallets later."),
                        SizedBox(
                          height: 12,
                        ),
                        Text("In the Balance field, feel free to type in an estimate."),
                        Text("Don't worry, you can edit it later."),
                        SizedBox(
                          height: 24,
                        ),
                        AddIncomeCard(),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back),
                            Text("    swipe"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Some good first ",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Color.fromARGB(255, 35, 206, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Column(
                      children: [
                        const ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.heartCircleCheck,
                            size: 25.0,
                            color: Color.fromARGB(255, 251, 127, 39),
                          ),
                          title: Text("Health"),
                        ),
                        const ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.bowlRice,
                            size: 25.0,
                            color: Color.fromARGB(255, 61, 177, 250),
                          ),
                          title: Text("Food"),
                        ),
                        const ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.bolt,
                            size: 25.0,
                            color: Color.fromARGB(255, 255, 128, 0),
                          ),
                          title: Text("Electricity"),
                        ),
                        const ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.cartShopping,
                            size: 25.0,
                            color: Color.fromARGB(255, 2, 218, 117),
                          ),
                          title: Text("Groceries"),
                        ),
                        const ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.plane,
                            size: 25.0,
                            color: Color.fromARGB(255, 11, 101, 218),
                          ),
                          title: Text("Transportation"),
                        ),
                        const ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.thumbsUp,
                            size: 25.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          title: Text("Miscellaneous"),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        FloatingActionButton.extended(
                          label: const Text(
                            "          add all         ",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 5, 61, 135),
                          onPressed: () {
                            addCategories();
                          },
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back),
                            Text("    swipe"),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: const Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Record your first",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Spend",
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Color.fromARGB(255, 35, 206, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      children: [
                        AddSpendCard(),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back),
                            Text("    swipe"),
                          ],
                        ),
                      ],
                    )
                  ),
                ],
              )
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        const Text("A spending tracker that mimics real life."),
                        const SizedBox(
                          height: 200,
                        ),
                        FloatingActionButton.extended(
                          label: const Text(
                            "          Get Started         ",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NavigationScreen()));
                            addDurations();
                          },
                        ),
                      ],
                    )
                  ),
                ]
              )
            ),
          ]
        )
      )
    );
  }
}
