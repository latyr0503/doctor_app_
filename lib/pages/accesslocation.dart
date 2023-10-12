import 'package:doctor_app/pages/location.dart';
import 'package:flutter/material.dart';

class AccessLocation extends StatelessWidget {
  const AccessLocation ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[100],
                ),
                child: Icon(
                  Icons.location_on,
                  size: 60,
                  color: Colors.blue[800],
                ),
              ),
              
            Container(
             margin: const EdgeInsets.only(top: 35),
              child: const Text(
              "Quelle est votre localisation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            ),

            Container(
             margin: const EdgeInsets.only(top: 20, bottom: 45),
              child: const Text(
              "Nous devons connaître votre position afin de vous suggérer \n des services à proximité",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            ),
          
            // ignore: avoid_unnecessary_containers
            Container(
              child: ElevatedButton(
                  onPressed: () => onDone(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Autoriser l'accès à la localisation",
                  style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),),
                ),
            ),

              Container(
                 margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextButton(
              onPressed: () => onDone(context),
              child: const Text(
                "Saisir l'emplacement manuellement",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              )

          ],
        ),
      ),
    );
  }
   void onDone(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Location(),
      ),
    );
  }
}