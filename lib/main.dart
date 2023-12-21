// import 'package:app/onboarding/welcome.dart';
import 'package:app/onboarding/welcome.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
// import "package:google_fonts/google_fonts.dart";
import 'navigation.dart';

// final theme = ThemeData(
//   useMaterial3: true,
//   textTheme: GoogleFonts.dmSansTextTheme(),
// );

int? onBoard;

Future<void> main() async {
  runApp(const MyApp());
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  onBoard = await prefs.getInt("onBoard");
  await prefs.setInt("onBoard", 0);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ferndi",
      // home: Onboarding(),
      initialRoute: onBoard == 0 || onBoard == null ? "onboard" : "home",
      routes: {
        "onboard": (context) => const Onboarding(),
        "home": (context) => const NavigationScreen(),
      },
      // home: NavigationScreen(),
    );
  }
}
