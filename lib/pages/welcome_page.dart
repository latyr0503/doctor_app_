// importation des differents package utilicer dans cette page
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
  // Pour gerer le loader en attendant que les donners charges
  bool isLoading = true;

  // declaration de la liste des spécialité
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
//fetch de la liste des hopitaux via l'api Django
  List<Map<String, dynamic>> dummyHopital = [];

  Future<List<Map<String, dynamic>>> fetchHospitals() async {
    final response = await http.get(Uri.parse(
        'https://doctor-app-h45i.onrender.com/hopital/list_hopital/'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to retrieve data from API');
    }
  }

//fetch de la liste des medecins via l'api Django
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
        // print(dummySpecialists);
        // Pour gerer le loader en attendant que les donners charges
        isLoading = false;
      });
    });
    fetchHospitals().then((data) {
      setState(() {
        // Mettez à jour votre liste de spécialistes avec les données obtenues
        dummyHopital = data;
        // print(dummyHopital);
        // Pour gerer le loader en attendant que les donners charges
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // cette fonction avait pour but d'afficher une image par defaut au cas ou url est null, vide ou rencontre un erreur 404
    // mais ca n'a pas marche. C'est pour quoi j'ai retourner une image par defaut pour tous
    ImageProvider getImage(String? url) {
      if (url == null || url.isEmpty) {
        return const NetworkImage(
          'https://img.freepik.com/vecteurs-libre/gens-qui-marchent-assis-au-batiment-hopital-exterieur-verre-clinique-ville-illustration-vectorielle-plane-pour-aide-medicale-urgence-architecture-concept-soins-sante_74855-10130.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=sph',
        );
      } else {
        http
            .head(Uri.parse('https://doctor-app-h45i.onrender.com$url'))
            .then((response) {
          if (response.statusCode == 404) {
            return const NetworkImage(
              'https://img.freepik.com/vecteurs-libre/gens-qui-marchent-assis-au-batiment-hopital-exterieur-verre-clinique-ville-illustration-vectorielle-plane-pour-aide-medicale-urgence-architecture-concept-soins-sante_74855-10130.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=sph',
            );
          } else {
            return NetworkImage('https://doctor-app-h45i.onrender.com$url');
          }
        });
        return const NetworkImage(
          'https://img.freepik.com/vecteurs-libre/gens-qui-marchent-assis-au-batiment-hopital-exterieur-verre-clinique-ville-illustration-vectorielle-plane-pour-aide-medicale-urgence-architecture-concept-soins-sante_74855-10130.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=sph',
        );
      }
    }

    // cette fonction avait pour but d'afficher une image par defaut au cas ou url est null, vide ou rencontre un erreur 404
    // mais ca n'a pas marche. C'est pour quoi j'ai retourner une image par defaut pour tous
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
    // print(getImage("url"));
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

                            // NetworkImage('https://doctor-app-h45i.onrender.com${dummyHopital[index]['image']}'),
                            width: 250,
                            onTap: () {
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
                  // map des donnés des doctors au niveau de la base de donné
                  Column(
                    children: dummySpecialists.take(3).map((specialist) {
                      print(specialist['jours']);
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
                        jours: specialist["jours"],
                        // permet de passer les donners fetcher dans une nouvelle page
                        onTap: () {
                          handleSpecialistSelection(
                            specialist['name'],
                            specialist['proffession'],
                            specialist['adresse'],
                            specialist['about'],
                            specialist['note'].toString(),
                            specialist['experience'].toString(),
                            specialist['image'].toString(),
                            // specialist['jours']
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
    ImageProvider imageProvider =
        NetworkImage('https://doctor-app-h45i.onrender.com$image');
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
