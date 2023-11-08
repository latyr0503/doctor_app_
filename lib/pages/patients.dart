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
  String? valueProbleme;
  List<String> listItem = ['Pour moi', 'Pour une autre'];
  List<String> genre = ['Macsulin', 'Feminin'];

  final _problemController = TextEditingController();
  final _ageController = TextEditingController();

  // Ajoutez un TextEditingController pour le champ de texte
  void savePatientDetails() async {
    if (valueChoose == null || valueGenre == null) {
      // Afficher un dialogue d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Veuillez sélectionner tous les champs',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red, // Durée d'affichage du message
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Données enregistrées avec succès!',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        duration:
            Duration(seconds: 3), // Durée d'affichage du message de succès
        backgroundColor: Color.fromRGBO(
            187, 222, 251, 1), // Couleur d'arrière-plan du message de succès
      ),
    );

    final prefs = await SharedPreferences.getInstance();

    // Sauvegarde des valeurs des DropdownButton
    prefs.setString('booking_for', valueChoose ?? '');
    prefs.setString('gender', valueGenre ?? '');

    final problemText = _problemController.text;
    prefs.setString('problem_text', problemText);

    final ageText = _ageController.text;
    prefs.setString('age_text', ageText);
    // Redirection vers la page Payer
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Payer()),
    );
  }

  String? bookingFor;
  String? gender;
  String? problemText;
  int? ageText;



  @override
  void initState() {
    super.initState();
    fetchPatientDetails();
  }

  Future<void> fetchPatientDetails() async {
    final prefs = await SharedPreferences.getInstance();
    bookingFor = prefs.getString('booking_for') ?? '';
    gender = prefs.getString('gender') ?? '';
    problemText = prefs.getString('problem_text') ?? '';
    ageText = (prefs.getInt('age_text') ?? 0);

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
                  width: 1.0,
                  color: Color.fromRGBO(243, 237, 237, 1),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Entrez votre âge",
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
}
