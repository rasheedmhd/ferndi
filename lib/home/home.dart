import "package:app/home/spends.dart";
import "package:flutter/material.dart";
import "package:app/cards/balance.dart";
import "package:app/cards/addSpend.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: Scaffold(
        appBar: AppBar(
          title: const 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Row(
                  children: [

                    FaIcon(
                      FontAwesomeIcons.chevronLeft, 
                      size: 20,
                      color: Colors.white
                    ),
                    SizedBox( width: 12,),
                    Text(
                      "This Month",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    SizedBox( width: 12,),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 20,
                      color: Colors.white
                    ),
                  ],
                ),
              ],
            ),
          backgroundColor: const Color.fromARGB(255, 5, 61, 135),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: const [
            BalanceCard(),
            SizedBox(
              height: 10,
            ),
            AddSpendCard(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Spend History",
              style: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 5, 61, 135),
                fontWeight: FontWeight.w700,
                // fontFamily: "WorkSans"
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              //padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
              height: 650,
              // height: double.infinity,
              child: Spends(),
            ),
          ],
    )));
  }
}
