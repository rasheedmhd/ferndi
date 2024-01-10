import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class SelectedWallets extends StatelessWidget {
  const SelectedWallets({required this.wallet, super.key});
  final Wallet wallet;

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
                mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 0,
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 204, 241, 228),
                child: const Icon(
                  Icons.add,
                  size: 25,
                  color: Color.fromARGB(255, 48, 136, 6),
                ),
              ),
              const Text("Wallets",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
              FloatingActionButton(
                mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 0,
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 204, 241, 228),
                child: const FaIcon(FontAwesomeIcons.penToSquare,
                    size: 20, color: Color.fromARGB(255, 48, 136, 6)),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${wallet.bal}",
                style: const TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
            ],
          ),
          Text("${wallet.name}",
            style: const TextStyle(
              fontSize: 23.0,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
        ],
      )
    );
  }
}
