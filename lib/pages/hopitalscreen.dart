import 'package:doctor_app/widgets/communique.dart';
import 'package:doctor_app/widgets/systemes_onglets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
    home: HopitalScren(),
  ));
}

class HopitalScren extends StatefulWidget {
  const HopitalScren({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HopitalScrenState createState() => _HopitalScrenState();
}

class _HopitalScrenState extends State<HopitalScren> {
  List <Map<String, dynamic>> travail = [
            {
              'titre' : 'Serenity Wellness Clinic',
              'sousTitre' : 'Dental, Skin Care, Eye Care',
              'location' : '8502 Preston Rd. Inglewood, Maine 98380',
              'time': '15min-1.5km-Mon Sun|11am - 11pm',
              'icon': Icons.location_on_rounded,
              'icone': Icons.access_time_filled,
              'color':  Colors.blue[800],
              'couleur':  Colors.grey,

            }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme,
      body: Stack(
        children: [
          Stack(
            children:[
              const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child:  Image(
                      image: AssetImage('assets/salle.jpg'),
                      fit: BoxFit.cover)),
              Container(
                margin: const EdgeInsets.all(20),
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const BackButton(),
              ),

              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.share)),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                  ),
                ],
              ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 150),
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            child: Column(
              children: [
                ...travail.map((item) {
            return Container(
              
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
              child: Column(
                children: [
                 Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topLeft,
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Text(item['titre'], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25)),
                      Text(item['sousTitre'], style: TextStyle(fontWeight: FontWeight.w600,color: item['couleur'])),
                     ],
                  ),
                 ),
                 SizedBox(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(item['icon'], color: item['color'],),
                          Text(item['location'], style: TextStyle(color: item['couleur']))
                        ],
                      ),
                      Row(
                          children: [
                          Icon(item['icone'], color: item['color'],),
                          Text(item['time'], style: TextStyle(color: item['couleur']),)
                          ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          ),
          SizedBox(height: 20,),
          // Composent reutilisable "communique.dart"
          Communiquer(),

          SizedBox(height: 20,),
          SystemesOnglet(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
