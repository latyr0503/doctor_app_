// ignore_for_file: library_private_types_in_public_api

import 'package:doctor_app/pages/add_card.dart';
import 'package:doctor_app/widgets/package.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: SelectPackage(),
  ));
}

class SelectPackage extends StatefulWidget {
  const SelectPackage({Key? key}) : super(key: key);

  @override
  _SelectPackageState createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
// Options de la liste déroulante


   String? valueChoose;
  List<String> listItem = ['30 minutes', '1h00', '1h30', '2h00'];
  int _value = 0;
  late SharedPreferences prefs;

  Future<void> saveSelectedDuration(String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('selected_duration', value);
  }

  Future<void> saveSelectedPackage(int value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('selected_package', value);
  }

   Future<void> saveSelectedMoney(int value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('selected_money', value);
  }
  



  // Votre fonction fetchSpecialists


  // int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Packages',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Select Duration',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0,
                        color: const Color.fromRGBO(
                            243, 237, 237, 1)), // Ajoutez une bordure
                    borderRadius: BorderRadius.circular(
                        10), // Facultatif : pour des coins arrondis
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('durée du rendez-vous'),
                      dropdownColor: Colors.blue[100],
                      icon: Icon(Icons.arrow_drop_down),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      iconSize: 36,
                      iconEnabledColor: Colors.blue,
                      isExpanded: true,
                      value: valueChoose,
                      onChanged: (String? newValue) {
                        setState(() {
                          valueChoose = newValue;
                          saveSelectedDuration(newValue!);
                        });
                      },
                      items: listItem.map((String ValueItem) {
                        return DropdownMenuItem<String>(
                          value: ValueItem,
                          child: Text(ValueItem),
                        );
                      }).toList(),
                      underline: Container(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: const Text('Select Package',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                             Card(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      children: [
                        const Package(
                          title: "Messaging",
                          subTitle: "Avec le docteur",
                          money: "2000cfa",
                          min: "/30min",
                          listTitleColor: Colors.blue,
                          iconColors: Color.fromRGBO(187, 222, 251,
                              1), // J'ai corrigé le nom de la propriété 'iconColor'.
                          leadingIcon: Icons.message_sharp,
                        ),
                        const Spacer(),
                        Radio<int>(
                          value: 1,
                          groupValue: _value,
                          onChanged: (int? value) {
                            if (value != null) {
                              setState(() {
                                _value = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      children: [
                        const Package(
                          title: "Appel Vocal",
                          subTitle: "Avec le docteur",
                          money: "4000cfa",
                          min: "/30min",
                          listTitleColor: Colors.blue,
                          iconColors: Color.fromRGBO(187, 222, 251,
                              1), // J'ai corrigé le nom de la propriété 'iconColor'.
                          leadingIcon: Icons.call,
                        ),
                        const Spacer(),
                        Radio<int>(
                          value: 2,
                          groupValue: _value,
                          onChanged: (int? value) {
                            if (value != null) {
                              setState(() {
                                _value = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      children: [
                        const Package(
                          title: "Appel Vidéo",
                          subTitle: "Avec le docteur",
                          money: "6000cfa",
                          min: "/30min",
                          listTitleColor: Colors.blue,
                          iconColors: Color.fromRGBO(187, 222, 251, 1),
                          leadingIcon: Icons.video_camera_front,
                        ),
                        const Spacer(),
                        Radio<int>(
                          value: 3,
                          groupValue: _value,
                          onChanged: (int? value) {
                            if (value != null) {
                              setState(() {
                                _value = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      children: [
                        const Package(
                          title: "En personne",
                          subTitle: "Avec le docteur",
                          money: "8000cfa",
                          min: "/30min",
                          listTitleColor: Colors.blue,
                          iconColors: Color.fromRGBO(187, 222, 251, 1),
                          leadingIcon: Icons.person,
                        ),
                        const Spacer(),
                        Radio<int>(
                          value: 4,
                          groupValue: _value,
                          onChanged: (int? value) {
                            if (value != null) {
                              setState(() {
                                _value = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     envoyerDuree();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
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
        ],
      ),
    );
  }
void envoyerDuree() async {
    if (valueChoose == null || _value == 0) {
      // Gérez la validation ici, par exemple, en affichant une alerte à l'utilisateur.
      return;
    }

    prefs = await SharedPreferences.getInstance();

    // Sauvegarde de la durée et du forfait sélectionnés
    prefs.setString('selected_duration', valueChoose!);
    prefs.setInt('selected_package', _value);

    // Redirection vers la page Summary
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCard()),
    );
  }
}
