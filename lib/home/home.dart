import "package:app/home/spends.dart";
import "package:flutter/material.dart";
import "package:app/cards/balance.dart";
import "package:app/cards/addSpend.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  void _addSpend() {
    showModalBottomSheet(context: context, builder: (ctx) => 
      const Text("Hello")
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Overview",
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: _addSpend, icon: const Icon(Icons.add))
          ],
          title: const Text("Home"),
          backgroundColor: const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: const [
            
            BalanceCard(),
            AddSpendCard(),

            SizedBox(height: 20,),

                Text(
                  "Spend History",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    // fontFamily: "WorkSans"
                  ),
                ),

                SizedBox(height: 10,),

                SizedBox(
                  //padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                  height: 500,
                  child: Spends(),
                ),

                // Container(
                //   height: 150,
                //   color: const Color.fromARGB(255, 224, 234, 251),
                //   child: const Spends(),
                // ),



                // Container(
                //   height: 400,
                //   color: Colors.green,
                //   child: const Spends(),
                // ),

                // const Row(children: [
                //   Text("Spend History"),
                //   Spacer(),
                //   Icon(Icons.money_rounded)
                // ]),

                // Container(
                //   height: 400,
                //   color: Colors.black54,
                // ),

                // const Row(children: [
                //   Text("Spend History"),
                //   Spacer(),
                //   Icon(Icons.money_rounded)
                // ]),

                Text("HI"),
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
            )));
  }
}
