import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class spendInfoCard2 extends StatelessWidget {
  const spendInfoCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 227, 226, 226),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Spending Insights",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              FaIcon(FontAwesomeIcons.arrowRightLong,
                  size: 23, color: Color.fromARGB(255, 151, 151, 151)),
              Text(
                " 11 ",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 151, 151, 151),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Divider(
            height: 0,
            color: Color.fromARGB(255, 227, 226, 226),
          ),
          const Text("data"),
          const Text("data"),
          const Text("data"),
          const Text("see all"),
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                      padding: const EdgeInsets.all(7),
                      color: const Color.fromARGB(198, 235, 232, 255),
                      child: const Text(
                        "   see all   ",
                        style: TextStyle(
                          color: Color.fromARGB(199, 71, 34, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
              const SizedBox(
                width: 20,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                      padding: const EdgeInsets.all(7),
                      color: const Color.fromARGB(198, 235, 232, 255),
                      child: const Text(
                        "   +   add category   ",
                        style: TextStyle(
                          color: Color.fromARGB(199, 71, 34, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
