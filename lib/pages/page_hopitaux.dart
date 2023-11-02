import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doctor_app/components/card_image.dart';

class PageHopitaux extends StatefulWidget {
  const PageHopitaux({Key? key});

  @override
  State<PageHopitaux> createState() => _PageHopitauxState();
}

class _PageHopitauxState extends State<PageHopitaux> {
  // list des hopitaux
  // final List<Map<String, dynamic>> dummyHopital = [
  //   {
  //     'title': 'Dentist',
  //     'subTitle': 'ghjklkh',
  //     'subTitleBis': 'rtyu',
  //     'imageCard': const AssetImage("assets/salle.jpg"),
  //   },
  //   {
  //     'title': 'Dentist',
  //     'subTitle': 'ghjklkh',
  //     'subTitleBis': 'rtyu',
  //     'imageCard': const AssetImage("assets/salle.jpg"),
  //   },
  //   {
  //     'title': 'Dentist',
  //     'subTitle': 'ghjklkh',
  //     'subTitleBis': 'rtyu',
  //     'imageCard': const AssetImage("assets/salle.jpg"),
  //   },
  //   {
  //     'title': 'Dentist',
  //     'subTitle': 'ghjklkh',
  //     'subTitleBis': 'rtyu',
  //     'imageCard': const AssetImage("assets/salle.jpg"),
  //   },
  // ];
  List<Map<String, dynamic>> dummyHopital = [];
  bool isLoading = true;

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

  @override
  void initState() {
    super.initState();
    fetchHospitals().then((data) {
      setState(() {
        dummyHopital = data;
        isLoading =
            false; // Mettre à jour isLoading une fois le chargement terminé
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
      }
      return const NetworkImage(
        'https://img.freepik.com/vecteurs-libre/gens-qui-marchent-assis-au-batiment-hopital-exterieur-verre-clinique-ville-illustration-vectorielle-plane-pour-aide-medicale-urgence-architecture-concept-soins-sante_74855-10130.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=sph',
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des hôpitaux", textAlign: TextAlign.center),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: dummyHopital.map((hospital) {
                  return CardImage(
                    title: hospital['name'],
                    subTitle: hospital['date'],
                    subTitleBis: hospital['adresse'],
                    imageCard: getImage(hospital['image']),
                    // NetworkImage(
                    //     'https://doctor-app-h45i.onrender.com${hospital['image']}'),
                    width: double.infinity,
                    onTap: () {
                      print("view card");
                    },
                  );
                }).toList(),
              ),
            ),
    );
  }
}
