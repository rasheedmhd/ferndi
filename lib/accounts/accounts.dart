import "package:app/cards/addCategory.dart";
import "package:app/cards/addWallet.dart";
import "package:app/cards/wallets.dart";
import "package:avatar_glow/avatar_glow.dart";
// import "package:app/cards/savings.dart";
import "package:flutter/material.dart";


class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  AccountsState createState() => AccountsState();
}

class AccountsState extends State<Accounts> {
  void _addCategory() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context, 
      isScrollControlled: true,
      builder: (ctx) => const AddCategoryCard(),
    );
  }
  void _addWallet() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context, 
      isScrollControlled: true,
      builder: (ctx) => const AddWalletCard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Accounts",
      theme: ThemeData(fontFamily: 'Gilroy'),
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                iconSize: 35,
                onPressed: _addCategory, 
                icon: const Icon(Icons.add, color: Colors.white,))
            ],
            title: const Text(
              "Accounts", 
              style: TextStyle(
                color: Colors.white
            ),),
            backgroundColor: const Color.fromARGB(255, 5, 61, 135),
          ),
          floatingActionButton: AvatarGlow(
            glowColor: const Color.fromARGB(255, 5, 61, 135),
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)
              ),
              backgroundColor: const Color.fromARGB(255, 5, 61, 135),
              onPressed: _addWallet,
              child: const Icon(Icons.add, color: Colors.white, size: 35,),
              ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: const [
              Text(
                "Wallets",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(
                height: 12,
              ),

              Divider(), 

              SizedBox(
                height: 700,
                child: WalletsCard(),
              )
            ],
          ),
        ));
  }
}
