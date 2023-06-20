import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class savingsCard extends StatelessWidget {
  const savingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child:  Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text("Total Amount Saved"),
            Text("GHS 120,000",
              style: GoogleFonts.hankenGrotesk(
                // textStyle: Theme.of(context).textTheme.headlineLarge,
                fontSize: 43.0,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 26, 114, 255),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    FloatingActionButton(
                      elevation: 3,
                      onPressed: () {},
                      backgroundColor: const Color.fromARGB(255, 19, 177, 54),
                      child: const Icon(Icons.add,
                      size: 35,
                      // color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Add Money")
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    FloatingActionButton(
                      elevation: 3,
                      onPressed: () {},
                      backgroundColor: Color.fromARGB(255, 241, 0, 36),
                      child: const Icon(Icons.remove,
                      size: 35,
                      // color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Withdraw")
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    FloatingActionButton(
                      elevation: 3,
                      onPressed: () {},
                      backgroundColor: Color.fromARGB(255, 255, 206, 8),
                      child: const Icon(Icons.wallet,
                      size: 35,
                      // color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Transfer")
                  ],
                ),

              ],
            )
          ],
       )
     )
    );
  }
}
