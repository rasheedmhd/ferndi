import "package:avatar_glow/avatar_glow.dart";
import "package:flutter/material.dart";

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
            const Text("GHS 10,000",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 5, 61, 135),
              )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    AvatarGlow(
                      glowColor: Color.fromARGB(255, 157, 255, 214),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      child: FloatingActionButton(
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                        elevation: 3,
                        onPressed: () {},
                        foregroundColor: const Color.fromARGB(255, 9, 163, 99),
                        backgroundColor: const Color.fromARGB(255, 231, 255, 245),
                        child: const Icon(Icons.add,
                        size: 35,
                        ),
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
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      elevation: 3,
                      onPressed: () {},
                      backgroundColor: const Color.fromARGB(255, 255, 231, 241),
                      foregroundColor: const Color.fromARGB(255, 163, 9, 71),
                      child: const Icon(Icons.remove,
                      size: 35,
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
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      elevation: 3,
                      onPressed: () {},
                      backgroundColor: const Color.fromARGB(255, 230, 243, 255),
                      foregroundColor: const Color.fromARGB(2255, 0, 128, 255),
                      child: const Icon(Icons.wallet,
                      size: 35,
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
