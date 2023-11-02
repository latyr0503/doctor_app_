import 'package:doctor_app/pages/payer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Importez le package shared_preferences

class Patient extends StatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  String? valueChoose;
  String? valueGenre;
  String? valueAge;
  List<String> listItem = ['Pour moi', 'Pour une autre'];
  List<String> genre = ['Macsulin', 'Feminin'];
  List<String> age = ['24 ans', '23 ans', '22 ans', '21 ans', '20 ans'];

  final _problemController =
      TextEditingController(); // Ajoutez un TextEditingController pour le champ de texte

  Future<void> savePatientDetails() async {
    final prefs = await SharedPreferences.getInstance();

    // Sauvegarde des valeurs des DropdownButton
    prefs.setString('booking_for',
        valueChoose ?? ''); // Valeur par défaut vide si rien n'est sélectionné
    prefs.setString('gender',
        valueGenre ?? ''); // Valeur par défaut vide si rien n'est sélectionné
    prefs.setString('age',
        valueAge ?? ''); // Valeur par défaut vide si rien n'est sélectionné

    // Sauvegarde du texte du champ de texte
    final problemText = _problemController
        .text; // Récupérez le texte à partir de la TextEditingController
    prefs.setString('problem_text', problemText);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Payer()),
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
          style: TextStyle(
              fontWeight:
                  FontWeight.bold), // Corrigez "fontweight" en "fontWeight"
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
              child: Text('Réservation pour'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
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
              child: Text('Genre'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButton<String>(
                    hint: const Text('Macsulin'),
                    dropdownColor: Colors.blue[100],
                    icon: const Icon(Icons.keyboard_arrow_down_sharp),
                    style: const TextStyle(
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
              child: Text('Votre age'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
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
            const SizedBox(height: 10),
            const Text('Écrivez votre problème'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: const Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller:
                    _problemController, // Utilisez le TextEditingController
                maxLines: 5,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Entrez votre texte ici',
                ),
                onChanged: (text) {
                  // Handle the text input here
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  savePatientDetails(); // Sauvegarde les détails du patient
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
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
            const SizedBox(height: 50),
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
