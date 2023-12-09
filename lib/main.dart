import "package:flutter/material.dart";
// import "package:google_fonts/google_fonts.dart";
import 'navigation.dart';

// final theme = ThemeData(
//   useMaterial3: true,
//   textTheme: GoogleFonts.dmSansTextTheme(),
// );

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "ferndi",
        home: NavigationScreen(),
    );
  }
}


