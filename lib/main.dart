import 'package:doctor_app/pages/add_card.dart';
import 'package:doctor_app/pages/ajoutcard.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor_App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700),
        useMaterial3: true,
      ),
      home: AjoutCard(),
    );
  }
}
