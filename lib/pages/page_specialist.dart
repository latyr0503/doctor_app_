import 'package:doctor_app/components/specialist.dart';
import 'package:doctor_app/pages/doctor_details.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PageSpecialist extends StatefulWidget {
  const PageSpecialist({super.key});

  @override
  State<PageSpecialist> createState() => _PageSpecialistState();
}

class _PageSpecialistState extends State<PageSpecialist> {
  
  // Liste de spécialistes
  // final List<Map<String, dynamic>> dummySpecialists = [
  //   {
  //     'name': 'Mareme FALL',
  //     'profession': 'Infirmière',
  //     'image': const AssetImage('assets/doc1.jpg'),
  //     'note': 3.5,
  //   },
  //   {
  //     'name': 'latyr SENE',
  //     'profession': 'Dentiste',
  //     'image': const AssetImage('assets/doc2.jpg'),
  //     'note': 2.5,
  //   },
  //   {
  //     'name': 'Pape Ndiaye',
  //     'profession': 'Assistant',
  //     'image': const AssetImage('assets/doc3.jpg'),
  //     'note': 4.5,
  //   },
  //   {
  //     'name': 'Racky CISSé',
  //     'profession': 'Aide soignant',
  //     'image': const AssetImage('assets/doc4.jpg'),
  //     'note': 4.8,
  //   },
  // ];
  List<Map<String, dynamic>> dummySpecialists = [];
  bool isLoading = true;

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
        // print(dummySpecialists);
        isLoading =
            false; // Mettre à jour isLoading une fois le chargement terminé
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider getImageSpecialist(String? url) {
      if (url == null || url.isEmpty) {
        return const NetworkImage(
          'https://img.freepik.com/photos-gratuite/vue-face-homme-souriant-portant-blouse-laboratoire_23-2149633830.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=ais',
        );
      } else {
        http
            .head(Uri.parse('https://doctor-app-h45i.onrender.com$url'))
            .then((response) {
          if (response.statusCode == 404) {
            return const NetworkImage(
              'https://img.freepik.com/photos-gratuite/vue-face-homme-souriant-portant-blouse-laboratoire_23-2149633830.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=ais',
            );
          } else {
            return NetworkImage('https://doctor-app-h45i.onrender.com$url');
          }
        });
      }
      return const NetworkImage(
        'https://img.freepik.com/photos-gratuite/vue-face-homme-souriant-portant-blouse-laboratoire_23-2149633830.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=ais',
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste Medecins", textAlign: TextAlign.center),
      ),
      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator(), // Indicateur de chargement pendant le chargement des données
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: dummySpecialists.map((specialist) {
                  // print(specialist['id']);
                  // print(specialist['name']);
                  // print(specialist['proffession']);
                  // print(specialist['image']);
                  // print(specialist['note']);
                  return Specialist(
                    id: Key,
                    name: specialist['name'],
                    proffession: specialist['proffession'],
                    image: getImageSpecialist(specialist['image']),
                    // NetworkImage(
                    //     'https://doctor-app-h45i.onrender.com${specialist['image']}'),
                    note: specialist['note'],
                    experience: specialist['experience'],
                    adresse: specialist['adresse'],
                    about: specialist['about'],
                    jours: specialist['jours'],
                    onTap: () {
                      handleSpecialistSelection(
                        specialist['name'],
                        specialist['proffession'],
                        specialist['adresse'],
                        specialist['about'],
                        specialist['note'].toString(),
                        specialist['experience'].toString(),
                        specialist['image'].toString(),
                        // specialist['jours'],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
    );
  }

  void handleSpecialistSelection(
    String name,
    String proffession,
    String adresse,
    String about,
    String note,
    String experience,
    String image,
    // List<Map<String, dynamic>> jours,
  ) {
    ImageProvider imageProvider =
        NetworkImage('https://doctor-app-h45i.onrender.com$image');
    print(imageProvider);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Details_doctor(
          name: name,
          proffession: proffession,
          adresse: adresse,
          about: about,
          note: note,
          experience: experience,
          imageProvider: imageProvider,
          // jours: jours,
        ),
      ),
    );
  }
}
