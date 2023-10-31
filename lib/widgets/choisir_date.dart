import 'package:doctor_app/pages/appoitment.dart';
import 'package:doctor_app/pages/page_specialist.dart';
import 'package:doctor_app/pages/review_summary.dart';
import 'package:doctor_app/pages/selectpackage.dart';
import 'package:doctor_app/pages/summary.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ChoixDate extends StatefulWidget {
  const ChoixDate({Key? key}) : super(key: key);

  @override
  _ChoixDateState createState() => _ChoixDateState();
}

class _ChoixDateState extends State<ChoixDate> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TimeOfDay? time = TimeOfDay.now();
  bool isTimeChosen = false;

  void envoyerDateEtHeure() async {
    // final String nameMedecin = _controller.text;
    final String date = _dateController.text;

    if (date.isEmpty || !isTimeChosen) {
      // Gérez la validation ici, par exemple, en affichant une alerte à l'utilisateur.
      return;
    }

    final String heureFormatee = '${time!.hour.toString().padLeft(2, '0')}:${time!.minute.toString().padLeft(2, '0')}';

   final prefs = await SharedPreferences.getInstance();
final savedAppointments = prefs.getStringList('saved_appointments') ?? [];

// final nameMedecinString = nameMedecin.toString(); // Assurez-vous que nameMedecin est converti en chaîne de caractères
final dateString = date.toString(); // Assurez-vous que date est converti en chaîne de caractères
final heureFormateeString = heureFormatee.toString(); // Assurez-vous que heureFormatee est converti en chaîne de caractères

final appointment = {
  // 'name_medecin': nameMedecinString,
  'date': dateString,
  'heure': heureFormateeString,
};
final appointmentJson = jsonEncode(appointment);
savedAppointments.add(appointmentJson);
await prefs.setStringList('saved_appointments', savedAppointments);

    _controller.clear();
    _dateController.clear();

    // Redirection vers la page Summary
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectPackage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'Nom du medecin',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              // ),
              // TextField(
              //   controller: _controller,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.blue,
              //       ),
              //     ),
              //     hintText: 'Name Medecin',
              //     iconColor: Colors.amber,
              //   ),
              // ),
              const Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                child: TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Color.fromRGBO(187, 222, 251, 1),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
              const Text(
                'Heure',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50, top: 10),
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                    ),
                    child: Text(
                      '${time!.hour.toString().padLeft(2, '0')}:${time!.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: FloatingActionButton(
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time!,
                        );
                        if (newTime != null) {
                          setState(() {
                            time = newTime;
                            isTimeChosen = true;
                          });
                        }
                      },
                      child: const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue[100],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    envoyerDateEtHeure();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Send Date and Time',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
