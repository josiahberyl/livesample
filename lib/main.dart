import 'package:flutter/material.dart';
import 'package:kisangro/home/home_screen.dart';
import 'package:kisangro/login/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kisangro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF26A450)),
      ),
      home: const HomeScreen(),
    );
  }
}
