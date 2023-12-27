import "package:app/cards/addSpend.dart";
import "package:app/cards/addWallet.dart";
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
          body: PageView(children: [
            Container(
              color: Colors.white,
              child: const Column(
                children: [
                  Padding(padding: EdgeInsets.all(20)),
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

                  SizedBox(
                    height: 12,
                  ),

                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.moneyBillTransfer,
                      size: 30.0,
                      color: Color.fromARGB(255, 16, 212, 173),
                    ),
                    title: Text("TRACK YOUR SPENDS"),
                    subtitle: Text(
                        "Spend from your wallets and record spends in real time like in real life"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.subscriptions,
                      size: 30.0,
                      color: Color.fromARGB(255, 50, 163, 255),
                    ),
                    title: Text("RECORD AND MONITOR SUBSCRIPTIONS"),
                    subtitle: Text(
                        "A beautiful UI to monitor and make informed decisions on your Subscriptions"),
                  ),
                  ListTile(
                    leading: FaIcon(
                      Icons.savings,
                      size: 30.0,
                      color: Color.fromARGB(255, 222, 121, 255),
                    ),
                    title: Text("SAVE AND GROW"),
                    subtitle:
                        Text("A savings wallet is a must to use ferndi"),
                  ),

                  SizedBox(
                    height: 70,
                  ),

                  Text("An opinionated way to manage your wealth"),

                  SizedBox(
                    height: 70,
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("swipe    "),
                        Icon(Icons.arrow_forward)
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
                  Padding(padding: EdgeInsets.all(20)),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Record your ",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Income",
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Color.fromARGB(255, 35, 206, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.moneyBillTransfer,
                      size: 30.0,
                      color: Color.fromARGB(255, 16, 212, 173),
                    ),
                    title: Text("EARNING"),
                    subtitle: Text(
                        "Your regular earnings, feel free to put any amount, you can edit later"),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.wallet,
                      size: 30.0,
                      color: Color.fromARGB(255, 231, 65, 151),
                    ),
                    title: Text("CREATE INCOME WALLET"),
                    subtitle: Text(
                        "In the next screen type \"Income\" in the Wallet Name field"),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("swipe    "),
                        Icon(Icons.arrow_forward)
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
                    Padding(padding: EdgeInsets.all(20)),
                    Text(
                      "Setup your first",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 5, 61, 135),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Wallet",
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Color.fromARGB(255, 35, 206, 135),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.wallet,
                          size: 75,
                          color: Color.fromARGB(255, 231, 65, 151),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: AddWalletCard(),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text("swipe    "),
                          Icon(Icons.arrow_forward)
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
                  const Padding(padding: EdgeInsets.all(20)),
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
                    height: 20,
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
                    backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                    onPressed: () {
                      addCategories();
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("swipe    "),
                        Icon(Icons.arrow_forward)
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
                    Padding(padding: EdgeInsets.all(20)),
                    Text(
                      "Record your first",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 5, 61, 135),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Spend",
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Color.fromARGB(255, 35, 206, 135),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        FaIcon(
                          (FontAwesomeIcons.featherPointed),
                          size: 75,
                          color: Color.fromARGB(255, 35, 206, 135),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: AddSpendCard(),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text("swipe    "),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ],
                )
                ),

            Container(
                color: Colors.white,
                child: Column(children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    "Welcome to Ferndi - A spending tracker that mimics real life"),
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
                ])),
          ])));
  }
}

