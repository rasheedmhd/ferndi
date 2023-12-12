import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
// import "package:app/models/schemas.dart";

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 204, 244, 90),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "current balance",
                        ),
                        Text("₵1,234,567.99",// ${currentBalance}",
                            style: GoogleFonts.hankenGrotesk(
                              // textStyle: Theme.of(context).textTheme.headlineLarge,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 5, 61, 135),
                            )),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("income"),
                        Text("₵12,000",
                            style: GoogleFonts.hankenGrotesk(
                              // textStyle: Theme.of(context).textTheme.headlineLarge,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(255, 5, 61, 135),
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("spend"),
                        Text("₵2,000",
                            style: GoogleFonts.hankenGrotesk(
                              // textStyle: Theme.of(context).textTheme.headlineLarge,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(255, 5, 61, 135),
                            )),
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
