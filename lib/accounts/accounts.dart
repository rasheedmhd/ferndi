import "package:app/cards/addCategory.dart";
import "package:app/cards/addWallet.dart";
import "package:app/cards/wallets.dart";
import "package:avatar_glow/avatar_glow.dart";
import "package:app/cards/savings.dart";
import "package:flutter/material.dart";
import "package:app/utility/schema/methods.dart";


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
              onPressed: _addCategory,
              icon: const Icon(
                Icons.add,
                size: 34,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
          ],
          title: const Text(
            "Accounts",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 19, 194, 110),
        ),
        floatingActionButton: AvatarGlow(
          glowColor: const Color.fromARGB(255, 48, 136, 6),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            backgroundColor: const Color.fromARGB(255, 48, 136, 6),
            onPressed: _addWallet,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 19, 194, 110),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(3.142 / 6),
                      colors: [
                      Color.fromARGB(255, 19, 194, 110),
                      Color.fromARGB(255, 127, 0, 254),
                      Color.fromARGB(255, 188, 247, 25),
                      Color.fromARGB(255, 201, 249, 226),
                  ])
                  ),
                child: PageView(
                  children: [ 
                    SelectedWallets(wallet: income),
                    SelectedWallets(wallet: savings),
                    SelectedWallets(wallet: debts),
                    SelectedWallets(wallet: flexible),
                    SelectedWallets(wallet: income),
                  ]
                ),
              )),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: const Color.fromARGB(255, 241, 255, 248),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10.0, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallets",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color.fromARGB(255, 48, 136, 6),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 2800,
                        child: WalletsCard(),
                      ),
                    ],
                  ),
                )),
            )
          ],
        )
      )
    );
  }
}
