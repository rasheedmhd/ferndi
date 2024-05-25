import "package:app/ops/create/addCategory.dart";
import "package:app/ops/create/addWallet.dart";
import "package:app/cards/wallets.dart";
import "package:app/cards/savings.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/wallets_provider.dart";
import "package:flutter/material.dart";

class Accounts extends ConsumerStatefulWidget {
  const Accounts({super.key});

  @override
  AccountsState createState() => AccountsState();
}

class AccountsState extends ConsumerState<Accounts> {
  @override
  Widget build(BuildContext context) {

    final income = ref.watch(
      selectedWallet("Income"),
    );
    final savings = ref.watch(
      selectedWallet("Savings"),
    );
    // final flexible = ref.watch(
    //   selectedWallet("Flexible"),
    // );
    final debts = ref.watch(
      selectedWallet("Debts"),
    );
    void addCategory() {
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) => const AddCategoryCard(),
      );
    }

    void addWallet() {
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) => const AddWalletCard(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        // [[ TO DO ]]
        // Add User Profile
        // actions: [
          // IconButton(
          //   onPressed: addCategory,
          //   icon: const Icon(
          //     Icons.p,
          //     size: 34,
          //     color: Color.fromARGB(255, 255, 255, 255),
          //   ),
          // )
        // ],
        title: const Text(
          "Accounts",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 19, 194, 110),
      ),
      floatingActionButton: CircleAvatar(
          radius: 25,
          child: FloatingActionButton(
            elevation: 1,
            heroTag: "addSpend",
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            backgroundColor: const Color.fromARGB(255, 19, 194, 110),
            onPressed: addWallet,
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
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 19, 194, 110),
                ),
                child: PageView(
                  children: [
                    // [[ TO DO ]]
                    SelectedWallets(income),
                    SelectedWallets(savings),
                    // SelectedWallets(flexible),
                    SelectedWallets(debts),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10.0, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Wallets",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 48, 136, 6),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: WalletsCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
