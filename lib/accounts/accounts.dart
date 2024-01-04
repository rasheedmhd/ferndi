import "package:app/cards/addCategory.dart";
import "package:app/cards/addWallet.dart";
import "package:app/cards/wallets.dart";
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
              IconButton(onPressed: _addCategory, icon: const Icon(
                Icons.add, 
                size: 34,
                color: Color.fromARGB(255, 19, 194, 110),
                )
              )
            ],
            title: const Text(
              "Accounts", 
              style: TextStyle(
                color: Color.fromARGB(255, 19, 194, 110),
            ),),
            backgroundColor: const Color.fromARGB(255, 241, 255, 248),
          ),
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0)
            ),
            backgroundColor: const Color.fromARGB(255, 5, 61, 135),
            onPressed: _addWallet,
            child: const Icon(
              Icons.add, color: Colors.white),
            ),
          body: Container(
            color: const Color.fromARGB(255, 241, 255, 248),
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: const [
                Text(
                  "Your Wallets",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 48, 136, 6),
                    fontWeight: FontWeight.w700,
                  ),
                ),
            
                SizedBox(
                  height: 12,
                ),
                        
                SizedBox(
                  height: 2800,
                  child: WalletsCard(),
                )
              ],
            ),
          ),
        ));
  }
}  
