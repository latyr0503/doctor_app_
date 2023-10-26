import 'package:doctor_app/pages/review.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Summe extends StatefulWidget {
  const Summe({super.key});

  @override
  State<Summe> createState() => _SummeState();
}

class _SummeState extends State<Summe> {
 
  List<Map<String, dynamic>> dummySpecialists = [];

  // Votre fonction fetchSpecialists
  Future<List<Map<String, dynamic>>> fetchSpecialists() async {
    final response = await http.get(
        Uri.parse('https://doctor-app-h45i.onrender.com/doctor/list_doctor/'));
    if (response.statusCode == 200) {
      // Si la requête est réussie, convertissez la réponse en une liste de Map
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      // Si la requête échoue, lancez une exception.
      throw Exception('Échec de la récupération des données depuis l\'API');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSpecialists().then((data) {
      setState(() {
        dummySpecialists = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste Medecin", textAlign: TextAlign.center),
      ),
      body: Column(
                children: dummySpecialists.map((specialist) {
                  return Reviewe(
                    date: specialist["date"],
                   heure: specialist["heure"],
                    id: Key);
                }).toList(),
              ),
            );
  }
}
