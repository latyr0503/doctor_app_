import 'package:doctor_app/pages/reservation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RendezVous extends StatefulWidget {
  const RendezVous({Key? key});

  @override
  _RendezVousState createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  Map<String, dynamic>? rendezVous; // Use a nullable Map object
  

  Future<List<JourModel>> fetchJours() async {
  final response = await http.get(Uri.parse('https://doctor-app-h45i.onrender.com/doctor/list_id_doctor/25/'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final jours = parseJourModels(jsonData['jours'].cast<Map<String, dynamic>>());
    return jours;
  } else {
    throw Exception('Failed to fetch jours');
  }
}

List<JourModel> parseJourModels(List<dynamic> responseBody) {
  return responseBody.map<JourModel>((json) => JourModel.fromJson(json)).toList();
}
  @override
Widget build(BuildContext context) {
  return FutureBuilder<List<JourModel>>(
    future: fetchJours(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Reservation(
          jours: snapshot.data!,
          // Extract other data from the "rendezVous" object
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}
}
