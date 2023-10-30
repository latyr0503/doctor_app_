import 'package:doctor_app/widgets/photo.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({Key? key});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
        // Mettez à jour votre liste de spécialistes avec les données obtenues
        dummySpecialists = data;
        print(dummySpecialists);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dummySpecialists.take(1).map((data) {
        print(data['id']);
        print(data['name']);
        print(data['proffession']);
        print(data['image']);
        print(data['adresse']);
        return Photo(
          id: Key,
          name: data['name'],
          proffession: data['proffession'],
          image: NetworkImage(
              'https://doctor-app-h45i.onrender.com${data['image']}'),
          adresse: data['adresse'],
        );
      }).toList(),
    );
  }
}
