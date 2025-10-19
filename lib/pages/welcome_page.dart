import 'package:doctor_app/components/banner_title.dart';
import 'package:doctor_app/components/card_calendar.dart';
import 'package:doctor_app/components/card_image.dart';
import 'package:doctor_app/components/navigation_menu.dart';
import 'package:doctor_app/components/specialist.dart';
import 'package:doctor_app/pages/doctor_details.dart';
import 'package:doctor_app/pages/page_hopitaux.dart';
import 'package:doctor_app/pages/page_specialist.dart';
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
  bool isLoading = false;

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

  // données factices pour les hôpitaux
  List<Map<String, dynamic>> dummyHopital = [
    {
      'name': 'Hôpital Central',
      'date': 'Ouvert 24h',
      'adresse': 'Rue Principale, Dakar',
      'image': null,
    },
    {
      'name': 'Clinique Est',
      'date': 'Lun - Ven',
      'adresse': 'Av. Sud, Dakar',
      'image': null,
    },
  ];

  // données factices pour les spécialistes
  List<Map<String, dynamic>> dummySpecialists = [
    {
      'name': 'Dr. Amadou Diallo',
      'proffession': 'Cardiologue',
      'image': null,
      'note': 4.8,
      'experience': 10,
      'adresse': 'Dakar',
      'about': 'Spécialiste en cardiologie avec 10 ans d\'expérience',
      'jours': ['Lun', 'Mer', 'Ven'],
    },
    {
      'name': 'Dr. Fatou Ndiaye',
      'proffession': 'Dentiste',
      'image': null,
      'note': 4.6,
      'experience': 6,
      'adresse': 'Dakar',
      'about': 'Dentiste spécialisé en orthodontie',
      'jours': ['Mar', 'Jeu'],
    },
    {
      'name': 'Dr. Ousmane Fall',
      'proffession': 'Neurologue',
      'image': null,
      'note': 4.9,
      'experience': 12,
      'adresse': 'Dakar',
      'about': 'Neurologue reconnu pour ses recherches cliniques',
      'jours': ['Lun', 'Mar', 'Jeu'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    ImageProvider getImage(String? url) {
      const placeholderHopital =
          'https://img.freepik.com/vecteurs-libre/gens-qui-marchent-assis-au-batiment-hopital-exterieur-verre-clinique-ville-illustration-vectorielle-plane-pour-aide-medicale-urgence-architecture-concept-soins-sante_74855-10130.jpg';
      if (url == null || url.isEmpty) {
        return NetworkImage(placeholderHopital);
      }
      // si c'est une URL complète fournie, l'utiliser ; sinon utiliser l'image de secours
      if (url.startsWith('http')) {
        return NetworkImage(url);
      }
      return NetworkImage(placeholderHopital);
    }

    ImageProvider getImageSpecialist(String? url) {
      const placeholderSpecialist =
          'https://img.freepik.com/photos-gratuite/vue-face-homme-souriant-portant-blouse-laboratoire_23-2149633830.jpg';
      if (url == null || url.isEmpty) {
        return NetworkImage(placeholderSpecialist);
      }
      if (url.startsWith('http')) {
        return NetworkImage(url);
      }
      return NetworkImage(placeholderSpecialist);
    }

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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  // section de l'input recherche
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15.0),
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
                  const BannerTitle(
                    textTitle: "Calendrier à venir",
                    pros: NavigationMenu(),
                  ),
                  // card d'un medecin
                  const CardCalendar(),
                  // entête de section spécialité
                  const BannerTitle(
                    textTitle: "Spécialité du docteur",
                    pros: PageSpecialist(),
                  ),
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
                  const BannerTitle(
                    textTitle: "hôpitaux à proximité",
                    pros: PageHopitaux(),
                  ),
                  // section des hopitaux en mappant les données
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        dummyHopital.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CardImage(
                            title: "${dummyHopital[index]['name']}",
                            subTitle: "${dummyHopital[index]['date']}",
                            subTitleBis: "${dummyHopital[index]['adresse']}",
                            imageCard: getImage(dummyHopital[index]['image']),
                            width: 250,
                            onTap: () {
                              // action de test
                              print("view card");
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  // entête de section spécialiste
                  const BannerTitle(
                    textTitle: "Spécialiste",
                    pros: PageSpecialist(),
                  ),
                  // map des donnés des doctors (factices)
                  Column(
                    children: dummySpecialists.take(3).map((specialist) {
                      return Specialist(
                        id: Key,
                        name: specialist['name'],
                        proffession: specialist['proffession'],
                        image: getImageSpecialist(specialist['image']),
                        note: specialist['note'],
                        experience: specialist['experience'],
                        adresse: specialist['adresse'],
                        about: specialist['about'],
                        jours: specialist["jours"],
                        onTap: () {
                          handleSpecialistSelection(
                            specialist['name'],
                            specialist['proffession'],
                            specialist['adresse'],
                            specialist['about'],
                            specialist['note'].toString(),
                            specialist['experience'].toString(),
                            specialist['image']?.toString() ?? '',
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
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
  ) {
    ImageProvider imageProvider = image.startsWith('http') && image.isNotEmpty
        ? NetworkImage(image)
        : const NetworkImage(
            'https://img.freepik.com/photos-gratuite/vue-face-homme-souriant-portant-blouse-laboratoire_23-2149633830.jpg');
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
        ),
      ),
    );
  }
}
