import "package:app/home/spends.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class SpendsPage extends StatefulWidget {
  const SpendsPage({super.key});

  @override
  SpendsPageState createState() => SpendsPageState();
}

class SpendsPageState extends State<SpendsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: FaIcon(FontAwesomeIcons.arrowLeft,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          // title: const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Row(
          //       children: [
          //         FaIcon(FontAwesomeIcons.chevronLeft,
          //           size: 20, color: Colors.white),
          //         SizedBox(
          //           width: 12,
          //         ),
          //         Text(
          //           "This Month",
          //           style: TextStyle(color: Colors.white),
          //         ),
          //         SizedBox(
          //           width: 12,
          //         ),
          //         FaIcon(FontAwesomeIcons.chevronRight,
          //           size: 20, color: Colors.white),
          //       ],
          //     ),
          //   ],
          // ),
          backgroundColor: const Color.fromARGB(255, 5, 61, 135),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color.fromARGB(255, 5, 61, 135),
                      child: const Text(
                        " this week ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color.fromARGB(198, 255, 255, 255),
                      child: const Text(
                        " this month ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 61, 135),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color.fromARGB(134, 255, 255, 255),
                      child: const Text(
                        " this year ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 61, 135),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),                
            Row(
              children: [
                const Text(
                  "Spend History",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                const FaIcon(FontAwesomeIcons.arrowRightLong,
                    size: 23, color: Color.fromARGB(255, 151, 151, 151)),
                Text(
                  " $totalTransactions ",
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 151, 151, 151),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 5600,
              child: Spends(),
            ),
          ],
        )));
    }
}
