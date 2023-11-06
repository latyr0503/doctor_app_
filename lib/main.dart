
import 'package:doctor_app/pages/accesslocation.dart';
import 'package:doctor_app/pages/card_page/card_page.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:doctor_app/pages/hopital_detail.dart';
import 'package:doctor_app/pages/hopitalscreen.dart';
import 'package:doctor_app/pages/page_specialist.dart';
import 'package:doctor_app/pages/payer.dart';
import 'package:doctor_app/pages/review_summary.dart';
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
      home: const CardPage(), 
    );
  }
}
