import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child:  Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text("Total Account balance"),
            Text("GHS 120,000",
                style: GoogleFonts.hankenGrotesk(
                  // textStyle: Theme.of(context).textTheme.headlineLarge,
                  fontSize: 43.0,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 26, 114, 255),
                )
              ),
          ],
        )
      )
    );
  }
}
