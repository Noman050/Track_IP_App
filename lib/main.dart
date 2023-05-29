import "package:flutter/material.dart";

import "homepage.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Noman Ali's Testing App",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.white,
        fontFamily: "Pacifico",
      ),
      home: HomePage(),
    );
  }
}
