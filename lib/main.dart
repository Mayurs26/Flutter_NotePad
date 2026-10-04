import 'package:flutter/material.dart';
import 'package:notepad/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Notes",
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}
