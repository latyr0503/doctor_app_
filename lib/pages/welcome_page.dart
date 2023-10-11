import 'package:doctor_app/pages/accesslocation.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Welcome_page extends StatelessWidget {
  const Welcome_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Bienvenue dans la page d'accueil",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color.fromRGBO(21, 101, 192, 1),
              ),
            ),
            ElevatedButton(
              onPressed: () => onDone(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Voir la page Location'),
            ),
          ],
        ),
      ),
    );
  }

  void onDone(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AccessLocation(),
      ),
    );
  }
}
