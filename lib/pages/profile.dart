// import 'package:doctor_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';

enum Gender { male, female, other }

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) => Container(
                  margin: const EdgeInsets.only(left: 20),
                )),
      ),
      body: Center(
        child: Form(
          child: Column(children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: const Text(
                'Complètez votre profile',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text(
                  "Don't worry, only you can see your personnal \n data. No one else will be able to see it",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(224, 224, 224, 1),
              ),
              child: const Icon(
                Icons.person,
                size: 100,
                color: Color.fromARGB(255, 26, 32, 39),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(width: 0.8),
                      ),
                      hintText: 'Nom Complet',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(width: 0.8),
                      ),
                      hintText: 'Entrer le Numéro de téléphone',
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 25),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(width: 0.8),
                      ),
                      hintText: 'Select Gendre',
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Complet Profile',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
