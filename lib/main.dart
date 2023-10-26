import 'package:doctor_app/components/doctor.dart';
import 'package:doctor_app/components/teste.dart';
import 'package:doctor_app/pages/appoitment.dart';
import 'package:doctor_app/pages/doctor_details.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:doctor_app/pages/payer.dart';
import 'package:doctor_app/pages/rendez_vous.dart';
import 'package:doctor_app/pages/reservation.dart';
import 'package:doctor_app/pages/selectpackage.dart';
import 'package:doctor_app/widgets/bookappoint.dart';
import 'package:doctor_app/widgets/communique.dart';
import 'package:doctor_app/widgets/systemes_onglets.dart';
import 'package:flutter/foundation.dart';
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
      home: RendezVous(),
    );
  }
}
