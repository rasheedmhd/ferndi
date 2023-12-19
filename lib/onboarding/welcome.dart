import "package:flutter/material.dart";

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
                child: const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
              
              Container(
                color: Colors.pink,
                child:const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
              
              Container(
                color: Colors.green,
                child:const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
              ),
              
              Container(
                child:const  Center(child: Text("Welcome to Ferndi - A spending tracker that mimics real life")),
                  color: Colors.blue,
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
