import 'package:doctor_app/pages/ajoutcard.dart';
import 'package:doctor_app/pages/recupere.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/pages/payer.dart';
import 'package:shared_preferences/shared_preferences.dart';
 // Importez le package shared_preferences

class Patient extends StatefulWidget {
  Patient({Key? key}) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  String? valueChoose;
  String? valueGenre;
  String? valueAge;
  List<String> listItem = ['Self', 'Other'];
  List<String> genre = ['Male', 'Female'];
  List<String> age = ['24 years', '23 years', '22 years', '21 years', '20 years'];
  
  final _problemController = TextEditingController(); // Ajoutez un TextEditingController pour le champ de texte

  Future<void> savePatientDetails() async {
    final prefs = await SharedPreferences.getInstance();

    // Sauvegarde des valeurs des DropdownButton
    prefs.setString('booking_for', valueChoose ?? ''); // Valeur par défaut vide si rien n'est sélectionné
    prefs.setString('gender', valueGenre ?? ''); // Valeur par défaut vide si rien n'est sélectionné
    prefs.setString('age', valueAge ?? ''); // Valeur par défaut vide si rien n'est sélectionné

    // Sauvegarde du texte du champ de texte
    final problemText = _problemController.text; // Récupérez le texte à partir de la TextEditingController
    prefs.setString('problem_text', problemText);
     // ignore: use_build_context_synchronously
     Navigator.pop(context);
     // ignore: use_build_context_synchronously
     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AjoutCard()),
         );
  }

  String? bookingFor;
  String? gender;
  String? problemText;

  @override
  void initState() {
    super.initState();
    fetchPatientDetails();
  }

  Future<void> fetchPatientDetails() async {
    final prefs = await SharedPreferences.getInstance();
    bookingFor = prefs.getString('booking_for') ?? '';
    gender = prefs.getString('gender') ?? '';
    age = (prefs.getString('age') ?? '') as List<String>;
    problemText = prefs.getString('problem_text') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Details',
          style: TextStyle(fontWeight: FontWeight.bold), // Corrigez "fontweight" en "fontWeight"
        ),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              child: Text('Booking for'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  child: DropdownButton<String>(
                    hint: Text('Self'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    isExpanded: true,
                    iconEnabledColor: Colors.blue,
                    value: valueChoose,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    underline: Container(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Gender'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  child: DropdownButton<String>(
                    hint: Text('Male'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    isExpanded: true,
                    iconEnabledColor: Colors.blue,
                    value: valueGenre,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueGenre = newValue;
                      });
                    },
                    items: genre.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    underline: Container(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Your Age'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  child: DropdownButton<String>(
                    hint: Text('24 years'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    isExpanded: true,
                    iconEnabledColor: Colors.blue,
                    value: valueAge,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueAge = newValue;
                      });
                    },
                    items: age.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    underline: Container(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Write your problem'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _problemController, // Utilisez le TextEditingController
                maxLines: 5,
                decoration: InputDecoration(
                  border:  InputBorder.none,
                  hintText: 'Enter your text here',
                ),
                onChanged: (text) {
                  // Handle the text input here
                },
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  savePatientDetails(); // Sauvegarde les détails du patient
                 

                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Réservation",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('age', age as String?));
  }
}
