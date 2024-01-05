import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:app/utility/schema/methods.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";




class savingsCard extends StatelessWidget {
  const savingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      elevation: 0,
                      onPressed: () {},
                      backgroundColor:
                          const Color.fromARGB(255, 204, 241, 228),
                      child: const Icon(
                        Icons.add,
                        size: 35,
                        color: Color.fromARGB(255, 48, 136, 6),
                      ),
                    ),
                    const Text("Wallets",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
                    FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      elevation: 0,
                      onPressed: () {},
                      backgroundColor:
                          const Color.fromARGB(255, 204, 241, 228),
                      child: const FaIcon(
                      FontAwesomeIcons.penToSquare,
                      size: 24,
                      color: Color.fromARGB(255, 48, 136, 6)
                    ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("GHS $subBalance",
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                    const Text(".00",
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Color.fromARGB(207, 255, 255, 255),
                      )),
                  ],
                ),
                const Text("Cash",
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              ],
            ));
  }
}
