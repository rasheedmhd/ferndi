import "package:app/home/spends.dart";
import "package:flutter/material.dart";


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}


class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Overview",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("budget23 - Record and Track spends"),
          backgroundColor: const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
        ),
        body: ListView(
          children: [
            Container (
              height: 100,
              color: Colors.yellow,
              child: const Text("Ferndi",
                  style: TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Helvetica"
                  ),
              ),
            ),
            
            Container(            
              height: 150,
              color: Colors.blueAccent,
              child: const Spends(),
            ),

            //Spends(),
            const Text("HI"),
            const SizedBox(height: 16),


            Container(
              height: 400,
              color: Colors.green,
              child: const Spends(),
            ),

            const Row(children: [Text("Spend History"), Spacer(), Icon(Icons.money_rounded)]),

            Container(
              height: 400,
              color: Colors.black54,
            ),

            const Row(children: [Text("Spend History"), Spacer(), Icon(Icons.money_rounded)]),
 
            const Text("HI"),

          ],

        // body: const Padding(
        // padding: EdgeInsets.only(
        //   left: 20,
        //   right: 20,
        // ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     // [[ FUTURE<feature> ]] card to display total spending amount in wallets (Money Left)
        //     // Total budgets amount, Total Savings Amount

        //     // card for inputting and recording a spend.
        //     Text("data"),
        //     // list of recorded expenses for the month.
        //     Text("data"),
        //     // SpendList(),
        //     // [[ FUTURE<feature> ]] button to check past spends grouped in months
        //     Text("data"),
        //     //Spends(),
        //   ],
        // )
        )
      )
    );
  }
}
