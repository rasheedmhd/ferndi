import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "budge23",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("budget23"),
        ),
        body: const Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
