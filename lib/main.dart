import 'package:flutter/material.dart';
import 'package:niemiecki_na_6/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niemiecki na 6',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const HomeScreen(),
    );
  }
}

