import 'package:doctor_app/components/banner_title.dart';
import 'package:doctor_app/components/card_calendar.dart';
import 'package:doctor_app/components/card_image.dart';
import 'package:doctor_app/components/specialist.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/components/card_speciality.dart';
// Importez les packages nécessaires
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Welcome_page extends StatefulWidget {
  const Welcome_page({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<Welcome_page> {
  // liste des spécialité
  final List<Map<String, dynamic>> dummySpecialities = [
    {
      'title': 'Dentist',
      'images': const AssetImage('assets/tooth.png'),
    },
    {
      'title': 'Cardiology',
      'images': const AssetImage('assets/cardio.png'),
    },
    {
      'title': 'Orthopaedie',
      'images': const AssetImage('assets/join.png'),
    },
    {
      'title': 'Neurologie',
      'images': const AssetImage('assets/brain.png'),
    },
  ];
  // list des hopitaux
  final List<Map<String, dynamic>> dummyHopital = [
    {
      'title': 'Dentist',
      'subTitle': 'ghjklkh',
      'subTitleBis': 'rtyu',
      'imageCard': const AssetImage("assets/salle.jpg"),
    },
    {
      'title': 'Dentist',
      'subTitle': 'ghjklkh',
      'subTitleBis': 'rtyu',
      'imageCard': const AssetImage("assets/salle.jpg"),
    },
    {
      'title': 'Dentist',
      'subTitle': 'ghjklkh',
      'subTitleBis': 'rtyu',
      'imageCard': const AssetImage("assets/salle.jpg"),
    },
    {
      'title': 'Dentist',
      'subTitle': 'ghjklkh',
      'subTitleBis': 'rtyu',
      'imageCard': const AssetImage("assets/salle.jpg"),
    },
  ];
// Liste de spécialistes
  final List<Map<String, dynamic>> dummySpecialists = [
    {
      'name': 'Mareme FALL',
      'profession': 'Infirmière',
      'image': const AssetImage('assets/doc1.jpg'),
      'note': 3.5,
    },
    {
      'name': 'latyr SENE',
      'profession': 'Dentiste',
      'image': const AssetImage('assets/doc2.jpg'),
      'note': 2.5,
    },
    {
      'name': 'Pape Ndiaye',
      'profession': 'Assistant',
      'image': const AssetImage('assets/doc3.jpg'),
      'note': 4.5,
    },
    {
      'name': 'Racky CISSé',
      'profession': 'Aide soignant',
      'image': const AssetImage('assets/doc4.jpg'),
      'note': 4.8,
    },
  ];

  // Votre liste de spécialistes
  // List<Map<String, dynamic>> dummySpecialists = [];
  // // Votre fonction fetchSpecialists
  // Future<List<Map<String, dynamic>>> fetchSpecialists() async {
  //   final response = await http.get(
  //       Uri.parse('https://doctor-app-h45i.onrender.com/doctor/list_doctor/'));
  //   if (response.statusCode == 200) {
  //     // Si la requête est réussie, convertissez la réponse en une liste de Map
  //     List<dynamic> data = json.decode(response.body);
  //     return data.map((item) => item as Map<String, dynamic>).toList();
  //   } else {
  //     // Si la requête échoue, lancez une exception.
  //     throw Exception('Échec de la récupération des données depuis l\'API');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchSpecialists().then((data) {
  //     setState(() {
  //       // Mettez à jour votre liste de spécialistes avec les données obtenues
  //       dummySpecialists = data;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 30,
              ))
        ],
        leading: const Icon(
          Icons.place,
          color: Color.fromRGBO(21, 101, 192, 1),
          size: 35,
        ),
        title: const Text.rich(
          TextSpan(
            text: "localisation\n",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Dakar, Sénégal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // section de l'input recherche
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, size: 30.0),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                    ),
                    onPressed: () {},
                    color: Colors.blue.shade800,
                    hoverColor: Colors.blue,
                  ),
                ),
              ),
            ),
            // entête de section card medecin
            const BannerTitle(textTitle: "Calendrier à venir"),
            // card d'un medecin
            const CardCalendar(),
            // entête de section spécialité
            const BannerTitle(textTitle: "Spécialité du docteur"),
            // section des spécialité en mappant les données
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: dummySpecialities.map((speciality) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardSpeciality(
                      title: speciality['title'],
                      images: speciality['images'],
                    ),
                  );
                }).toList(),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            // entête de section hopitaux
            const BannerTitle(textTitle: "hôpitaux à proximité"),
            // section des hopitaux en mappant les données
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  dummyHopital.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardImage(
                      title: "${dummyHopital[index]['title']}",
                      subTitle: " ${dummyHopital[index]['subTitle']}",
                      subTitleBis: "${dummyHopital[index]['subTitleBis']}",
                      imageCard: dummyHopital[index]['imageCard'],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            // entête de section spécialiste
            const BannerTitle(textTitle: "Spécialiste"),
            // azertyuio
            Column(
              children: dummySpecialists.map((specialist) {
                return Specialist(
                  id:Key,
                  name: specialist['name'],
                  proffession: specialist['profession'],
                  image: specialist['image'],
                  note: specialist['note'],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
