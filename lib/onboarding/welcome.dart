import "package:app/cards/addSpend.dart";
import "package:app/cards/addWallet.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";


// final theme = ThemeData(
//   useMaterial3: true,
//   textTheme: GoogleFonts.dmSansTextTheme(),
// );

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ferndi",
      home: Scaffold(
          appBar:  AppBar(
            title: const Text("Onboarding"),
          ),
          body: PageView(
            children: [
              
              Container(
                color: Colors.blue,
                child: const Column( children: [
                  Padding(padding: EdgeInsets.all(20)), 
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                  "Welcome to ",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                    // fontFamily: "WorkSans"
                  ),
                ),
                  Text(
                  "Ferndi",
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                    // fontFamily: "WorkSans"
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.moneyBillTransfer,
                    size: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                  ),
                  title: Text("RECORD YOUR SPENDING"),
                  subtitle: Text("Spend from your wallets and record spends in real time"),
                  // trailing: Text(spend.amount),
                ),
                ListTile(
                  leading: Icon(
                    Icons.subscriptions,
                    size: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                  ),
                  title: Text("RECORD AND MONITOR SUBSCRIPTIONS"),
                  subtitle: Text("A beautiful UI to monitor and make informed decisions on your Subscriptions"),
                  // trailing: Text(spend.amount),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.moneyBillTransfer,
                    size: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                  ),
                  title: Text("SAVE AND GROW"),
                  subtitle: Text("A savings wallet is a must to use ferndi"),
                  // trailing: Text(spend.amount),
                ),

                Center(child: Text("An opinionated way to manage your wealth")),

                Center(child: Text("A spend tracker app that mimics real world spending")),

                ],),
              ),
              
              Container(
                color: Colors.pink,
                child: const Column(
                  children: [
                    Text(
                    "Setup you first",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                      // fontFamily: "WorkSans"
                    ),),
                    Center(
                      child: Row(
                        children: [
                          Text(
                          "Wallet",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromARGB(255, 5, 61, 135),
                            fontWeight: FontWeight.w700,
                            // fontFamily: "WorkSans"
                          ),),
                          Icon((Icons.money_off_csred_outlined)),
                      
                        ],
                      ),
                    ),
                    AddWalletCard(),
                  ],
                )
                // child: const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
              
              Container(
                color: Colors.green,
                child:const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
              
              Container(
                color: Colors.blue,
                child: const Column(
                  children: [
                    Text("Please create your first spend"),
                    AddSpendCard(),
                  ],
                ),
                // child: const Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
            ],
          ) 
      )
         
    );
  }
}

// class OnboardingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("Welcome to Ferndi - A spending tracker that mimics real life");
//   }
// }
