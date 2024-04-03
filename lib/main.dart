import 'package:app/onboarding/welcome.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation.dart';


int? onBoard;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preference = await SharedPreferences.getInstance();
  onBoard = preference.getInt("onBoard");
  await preference.setInt("onBoard", 1);
  runApp(
    const ProviderScope(
      child: MyApp(),  
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ferndi", 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gilroy'),
      initialRoute: onBoard == 0 || onBoard == null ? "onboard" : "app",
      routes: {
        "app" : (context) => const NavigationScreen(),
        "onboard" : (context) => const Onboarding(),
      },
    );
  }
}
