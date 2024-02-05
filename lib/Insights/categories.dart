// import "package:app/home/spends.dart";
// import "package:app/utility/schema/methods.dart";
// import "package:app/providers/spends_provider.dart";
import "package:app/Insights/category.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class Categories extends ConsumerStatefulWidget {
  const Categories({super.key});

  @override
  SpendsPageState createState() => SpendsPageState();
}

class SpendsPageState extends ConsumerState<Categories> {
  @override
  Widget build(BuildContext context) {

  // final spendsCount = ref.watch(spendsCountProvider);
  
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
              backgroundColor: const Color.fromARGB(255, 5, 61, 135),
            ),
            body: ListView(
              padding: const EdgeInsets.all(15),
              children: const [
              Row(
                  children: [
                    const Text(
                      "All Categories",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 5, 61, 135),
                      ),
                    ),
                    const Spacer(),
                    const FaIcon(FontAwesomeIcons.arrowRightLong,
                        size: 23, color: Color.fromARGB(255, 151, 151, 151)),
                    Text(
                      " 11 ",
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
                  child: Categorys(),
                ),
              ],
            )));
  }
}
