import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'navigation.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.dmSansTextTheme(),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        title: "budget23 - Budget",
        home: const NavigationScreen(),
    );
  }
}
