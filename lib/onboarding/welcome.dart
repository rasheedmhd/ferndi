import "package:app/ops/create/addIncome.dart";
import "package:app/ops/create/addCategories.dart";
import "package:app/navigation.dart";
import "package:app/providers/wallets_provider.dart";
import "package:app/providers/categories_provider.dart";
import "package:app/providers/subs_provider.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class Onboarding extends ConsumerWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesCount = ref.watch(categoriesNotifier).length;
    final incomeWalletExist = ref.read(getWalletByName("Income"));

    return MaterialApp(
      title: "ferndi",
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Onboarding"),
        ),
        body: PageView(
          children: [
            Container(
              color: Colors.white,
              child: const Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Welcome to ",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Ferndi",
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Color.fromARGB(255, 35, 206, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.moneyBillTransfer,
                            size: 24.0,
                            color: Color.fromARGB(255, 16, 212, 173),
                          ),
                          title: Text("TRACK YOUR SPENDS"),
                          subtitle: Text(
                              "Spend from your Wallets and track Spends in real time like in real life."),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.subscriptions,
                            size: 30.0,
                            color: Color.fromARGB(255, 50, 163, 255),
                          ),
                          title: Text("TRACK YOUR SUBSCRIPTIONS"),
                          subtitle: Text(
                              "Know how much you spend on Subscriptions to empower your budgeting."),
                        ),
                        ListTile(
                          leading: FaIcon(
                            Icons.savings,
                            size: 30.0,
                            color: Color.fromARGB(255, 222, 121, 255),
                          ),
                          title: Text("SAVE AND GROW"),
                          subtitle: Text(
                              "A recommended savings Wallet to grow your wealth."),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Text("An opinionated way to manage your wealth."),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back),
                            Text("    swipe"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                Container(
                  color: Colors.white,
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Setup your first",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color.fromARGB(255, 5, 61, 135),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Wallet",
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Color.fromARGB(255, 35, 206, 135),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Wallets are where you spend from."),
                            Text("You can add more Wallets later."),
                            SizedBox(
                              height: 12,
                            ),
                            Text("In the Balance field, type in an estimate."),
                            Text("Don't worry, you can edit it later."),
                            SizedBox(
                              height: 24,
                            ),
                            AddIncomeCard(),
                            SizedBox(
                              height: 70,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back),
                                Text("    swipe"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                Container(
                  color: Colors.white,
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Some good first ",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color.fromARGB(255, 5, 61, 135),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Color.fromARGB(255, 35, 206, 135),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AddCategoriesCard(),
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        const Text("A spending tracker that mimics real life."),
                        const SizedBox(
                          height: 200,
                        ),
                        FloatingActionButton.extended(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          label: const Text(
                            "          Get Started         ",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 5, 61, 135),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NavigationScreen(),
                              ),
                            );
                            ref
                                .read(subscriptionsNotifier.notifier)
                                .addDurations();
                            if (incomeWalletExist!.name.isEmpty) {
                              ref.read(walletsNotifier.notifier).addWallets();
                            } else {
                              ref.read(walletsNotifier.notifier).noIncomeWallets();
                            }
                            if (categoriesCount == 0) {
                              ref
                                  .read(categoriesNotifier.notifier)
                                  .addCategories();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
