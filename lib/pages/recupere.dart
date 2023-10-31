import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importez le package shared_preferences

class Recup extends StatefulWidget {
  @override
  _RecupState createState() => _RecupState();
}

class _RecupState extends State<Recup> {
  String? bookingFor;
  String? gender;
  String? age;
  String? problemText;

  @override
  void initState() {
    super.initState();
    fetchPatientDetails(); // Appelez la fonction pour récupérer les données lors de l'initialisation de la page.
  }

  Future<void> fetchPatientDetails() async {
    final prefs = await SharedPreferences.getInstance();
    bookingFor = prefs.getString('booking_for') ?? '';
    gender = prefs.getString('gender') ?? '';
    age = prefs.getString('age') ?? '';
    problemText = prefs.getString('problem_text') ?? '';

    // Mettez à jour l'interface avec les données récupérées, par exemple, en utilisant setState.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Booking for: $bookingFor'),
            Text('Gender: $gender'),
            Text('Age: $age'),
            Text('Problem Text: $problemText'),
          ],
        ),
      ),
    );
  }
}
