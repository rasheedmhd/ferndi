import "package:app/home/spends.dart";
import "package:flutter/material.dart";

Widget homeCard() {
  return  Card(
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text("above spend"),
        ],
      )
    )
  );
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  // Widget _balanceCard() {
  //   return Card(
  //     shape:
  //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //     child: const Padding(padding: EdgeInsets.all(2), child: Text("data")));
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Overview",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("budget23 - Record and Track spends"),
          backgroundColor: const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
        ),
        body: Container( 
          padding: const EdgeInsets.all(15.0),
          child: Column(children: <Widget>[
              homeCard(),  
              homeCard(),               
            ],
            // body: ListView.builder(
            //   // itemCount: .length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Spends();
            //   }
          ),
        ),
      )
    );
  }
}
