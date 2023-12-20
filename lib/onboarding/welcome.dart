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

  void addAll() {}

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
                    Icons.savings,
                    size: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                  ),
                  title: Text("SAVE AND GROW"),
                  subtitle: Text("A savings wallet is a must to use ferndi"),
                  // trailing: Text(spend.amount),
                ),

                Center(child: Text("An opinionated way to manage your wealth")),
                //- Center(child: Text("A spend tracker app that mimics real world spending")),

                SizedBox(
                  height: 70,
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("swipe    "),
                      // Spacer(),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),

                ],),
              ),
              Container(
                color: Colors.purple,
                child: const Column( children: [
                  Padding(padding: EdgeInsets.all(20)), 
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                  "Record your ",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                    // fontFamily: "WorkSans"
                  ),
                ),
                  Text(
                  "Income",
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
                  title: Text("EARNING"),
                  subtitle: Text("Your regular earnings, feel free you put any amount, you can edit later"),
                  // trailing: Text(spend.amount),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.wallet,
                    size: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                  ),
                  title: Text("CREATE INCOME WALLET"),
                  subtitle: Text("In the next screen type \"Income\" in the Wallet Name field"),
                  // trailing: Text(spend.amount),
                ),

                Center(child: Text("An opinionated way to manage your wealth")),
                //- Center(child: Text("A spend tracker app that mimics real world spending")),

                SizedBox(
                  height: 70,
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("swipe    "),
                      // Spacer(),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),

                ],),
              ),
              Container(
                // color: Colors.purple,
                child: const Column( children: [
                  Padding(padding: EdgeInsets.all(20)), 
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                  "Some good first ",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 5, 61, 135),
                    fontWeight: FontWeight.w700,
                    // fontFamily: "WorkSans"
                  ),
                  ),
                    Text(
                    "Categories",
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
                      FontAwesomeIcons.heartCircleCheck,
                      size: 25.0,
                      color: Color.fromARGB(255, 11, 101, 218),
                    ),
                    title: Text("Health"),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.bowlRice,
                      size: 25.0,
                      color: Color.fromARGB(255, 11, 101, 218),
                    ),
                    title: Text("Food"),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.bolt,
                      size: 25.0,
                      color: Color.fromARGB(255, 11, 101, 218),
                    ),
                    title: Text("Electricity"),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.cartShopping,
                      size: 25.0,
                      color: Color.fromARGB(255, 11, 101, 218),
                    ),
                    title: Text("Groceries"),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.plane,
                      size: 25.0,
                      color: Color.fromARGB(255, 11, 101, 218),
                    ),
                    title: Text("Transportation"),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.thumbsUp,
                      size: 25.0,
                      color: Color.fromARGB(255, 11, 101, 218),
                    ),
                    title: Text("Miscellaneous"),
                  ),

                  // SizedBox(
                  //   height: 20,
                  // ),

                  // ListTile(
                  //   leading: FaIcon(
                  //     FontAwesomeIcons.handsBubbles,
                  //     size: 25.0,
                  //     color: Color.fromARGB(255, 11, 101, 218),
                  //   ),
                  //   title: Text("Miscellaneous"),
                  // ),

                  // Center(child: Text("An opinionated way to manage your wealth")),
                  //- Center(child: Text("A spend tracker app that mimics real world spending")),

                  FloatingActionButton.extended(
                    // isExtended: true,
                    label: Text(
                      "          add all         ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 5, 61, 135),
                    onPressed: (context) {},

                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("swipe    "),
                        // Spacer(),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),

                ],),
              ),
              
              Container(
                color: Colors.pink,
                child: const Column(
                  children: [
                    Padding(padding: EdgeInsets.all(20)), 
                    Text(
                    "Setup your first",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                      // fontFamily: "WorkSans"
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        "Wallet",
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Color.fromARGB(255, 5, 61, 135),
                          fontWeight: FontWeight.w700,
                          // fontFamily: "WorkSans"
                        ),),
                        Icon((Icons.wallet), size: 75,),
                    
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: AddWalletCard(),
                    ),

                    SizedBox(
                      height: 70,
                    ),

                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("swipe    "),
                          // Spacer(),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ],
                )
                // child: const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
              Container(
                color: Colors.green,
                child: const Column(
                  children: [
                    Padding(padding: EdgeInsets.all(20)), 
                    Text(
                    "Record your first",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                      // fontFamily: "WorkSans"
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        "Spend",
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Color.fromARGB(255, 5, 61, 135),
                          fontWeight: FontWeight.w700,
                          // fontFamily: "WorkSans"
                        ),),
                        FaIcon((FontAwesomeIcons.feather), size: 75,),
                    
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: AddSpendCard(),
                    ),

                    SizedBox(
                      height: 70,
                    ),

                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("swipe    "),
                          // Spacer(),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ],
                )
                // child: const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
              
              Container(
                color: Colors.green,
                child:const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
              
              // Container(
              //   color: Colors.blue,
              //   child: const Column(
              //     children: [
              //       Text("Please create your first spend"),
              //       AddSpendCard(),

              //     SizedBox(
              //      height: 200,
              //     ),

              //     Padding(
              //       padding: EdgeInsets.all(20.0),
              //       child: Row(
              //         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Text("swipe    "),
              //           // Spacer(),
              //           Icon(Icons.arrow_forward)
              //         ],
              //       ),
              //     ),
              //     ],
              //   ),
              //   // child: const Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              // ),
            ],
          ) 
      )
         
    );
  }
}