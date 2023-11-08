import 'package:doctor_app/components/doctor.dart';
  import 'package:doctor_app/pages/validation.dart';
  import 'package:flutter/material.dart';
  import 'dart:convert';
  import 'package:http/http.dart' as http;
  import 'package:shared_preferences/shared_preferences.dart';

  // ignore: must_be_immutable
  class Summary extends StatefulWidget {
    const Summary({super.key});

    @override
    State<Summary> createState() => _SummeState();
  }

  class _SummeState extends State<Summary> {

Future<void> sendAppointmentsToDjango() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAppointments = prefs.getStringList('saved_appointments') ?? [];

    for (String jsonString in savedAppointments) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      final response = await http.post(
        Uri.parse('https://doctor-app-h45i.onrender.com/rendez_vous/create_rendez_vous/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(jsonMap),
      );

      if (response.statusCode == 201) {
        print('Requête correcte');
        // La donnée a été enregistrée avec succès sur le serveur Django.
        // Vous pouvez également supprimer la donnée de SharedPreferences si nécessaire.
      } else if (response.statusCode == 400) {
        // Gérez l'erreur 400 (Bad Request) ici.
        print('Erreur 400: Requête incorrecte');
        // Vous pouvez afficher un message d'erreur à l'utilisateur ou effectuer d'autres actions nécessaires.
      } else {
        // Gérez d'autres codes d'erreur ici.
        print('Erreur ${response.statusCode}: ${response.reasonPhrase}');
        // Vous pouvez afficher un message d'erreur à l'utilisateur ou effectuer d'autres actions nécessaires.
      }
    }
  }

    //  Durée et Package

    String? duree;
    int? package;

    Future<void> fetchSelectedValues() async {
      final prefs = await SharedPreferences.getInstance();
      duree = prefs.getString('selected_duration');
      package = prefs.getInt('selected_package');
      setState(() {
        // Mettez à jour l'interface avec les valeurs récupérées
      });
    }




// Utilisation des données récupérées

    String? booking;
    String? gender;
    String? probleme;
     int? age;
    Future<void> fetchPatientDetails() async {
      final prefs = await SharedPreferences.getInstance();
      booking = prefs.getString('booking_for') ?? '';
      gender = prefs.getString('gender') ?? '';
      probleme = prefs.getString('problem_text') ?? '';
      age = (prefs.getInt('age_text') ?? 0);


      // Mettez à jour l'interface avec les données récupérées, par exemple, en utilisant setState.
      setState(() {});
    }

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


    @override
    void initState() {
      super.initState();
      loadAppointments();
      fetchPatientDetails();
      fetchSelectedValues();
      // Appelez la fonction pour récupérer les données lors de l'initialisation de la page.
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Résumé des commentaires',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: const BackButton(),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const Details(),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 25,
              endIndent: 25,
              height: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: appointments.map((appointment) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0,),
                            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text('Date & Heure',  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                                Text('${appointment['date']} | ${appointment['heure']} AM', style: const TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        );
                      }).toList(), // N'oubliez pas d'appeler .toList() à la fin pour obtenir une liste de widgets
                    ),
                  ),
                  
                  Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Duration', style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),),
                    Text('$duree',style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),  
              ),

              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Package', style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),),
                    Text(getPackageName(package),style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),  
              ),
                
                Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Booking for', style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),),
                    Text('$booking',style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),  
              ),

              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Gender', style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                    Text('$gender',style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),  
              ),

              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Age', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),),
                    Text('$age',style: const TextStyle(fontWeight: FontWeight.w600)),

                    // TEXTFIELD....
                  ],
                ),  
              ),

              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Message', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                    Text('$probleme',style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),  
              ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
              child: const Row(
                children: [
                  Text('Total',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey)),
                  Spacer(),
                  Text(
                    '2000cfa',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 25,
              endIndent: 25,
              height: 0,
            ), 

            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.vignette,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('Cash',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Validation()),
                      );
                    },
                    child: const Text('Change'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  sendAppointmentsToDjango(); 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Validation()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Play Now",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    String getPackageName(int? packageValue) {
      switch (packageValue) {
        case 1:
          return "Messaging";
        case 2:
          return "Appel Vocal";
        case 3:
          return "Appel Vidéo";
        case 4:
          return "En personne";
        default:
          return "Package non sélectionné";
      }
    }
  }
