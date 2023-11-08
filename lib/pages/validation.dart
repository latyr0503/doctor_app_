import 'package:doctor_app/components/navigation_menu.dart';
import 'package:doctor_app/pages/page_specialist.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Validation extends StatefulWidget {
  const Validation({Key? key});

  @override
  State<Validation> createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  List<Map<String, String>> appointments = [];

  void loadAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAppointments = prefs.getStringList('saved_appointments') ?? [];
    if (savedAppointments.isNotEmpty) {
      final jsonString = savedAppointments.last; // Accédez au dernier élément
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final lastAppointment = Map<String, String>.from(jsonMap);

      setState(() {
        appointments.add(lastAppointment);
      });
    }
  }

  late String username;

  @override
  void initState() {
    super.initState();

      loadAppointments();
    // Initialisation de SharedPreferences pour récupérer les données sauvegardées
    SharedPreferences.getInstance().then((preferences) {
      setState(() {
        username = preferences.getString('username') ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[800],
              ),
              child: const Icon(
                Icons.check,
                size: 60,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: const Text(
                "Payment Successful",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                "you have successfully booked an appointment with",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 45),
              child: const Text(
                "Dr. Jonny Wilson",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              const Icon(Icons.person, color: Colors.blue),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                username,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Row(
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '2000cfa',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          children: appointments.map((appointment) {
                            return Container(
                              child: Container(
                              margin: const EdgeInsets.only(top:8.0),
                                child: Row(
                                  
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: [
                                             const Icon(Icons.calendar_month,
                                                  color: Colors.blue),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${appointment['date']}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                     SizedBox(width: 16,),
                                      Expanded(
                                        child: Container(
                                       alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.timer_rounded,
                                                color: Colors.blue,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${appointment['heure']}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                              ),
                            );
                          }).toList(), // N'oubliez pas d'appeler .toList() à la fin pour obtenir une liste de widgets
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageSpecialist()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "View Appointment",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationMenu()),
                  );
                },
                child: const Text(
                  'Go to Home',
                  style: TextStyle(
                    fontSize: 20,
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
}
