import 'package:assignment_task/screens/homepage_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xff5d0d8b)
        ),
        useMaterial3: true,
        fontFamily: "din_next_rounded_lt_pro_medium",
      ),
      home: const HomePageScreen()
    );
  }
}

