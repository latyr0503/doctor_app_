import 'package:doctor_app/pages/patients.dart';
import 'package:doctor_app/widgets/package.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Ici l'utid=sation peut selectionner ses infos ou pour un autre
class SelectPackage extends StatefulWidget {
  const SelectPackage({Key? key}) : super(key: key);

  @override
  _SelectPackageState createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
// Options de la liste déroulante

  String? valueChoose;
  List<String> listItem = ['30 minutes', '1h00', '1h30', '2h00'];

  // cette  variable est pour les bouton radios
  int _value = 0;

  int money = 20;
  int money1 = 40;
  int money2 = 60;
  int money3 = 80;
  int money4 = 100;



//  Envoie des donnees dans le local storage au niveau sharedpreferences
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
                        10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Durée du rendez-vous'),
                      dropdownColor: Colors.blue[100],
                      icon: const Icon(Icons.arrow_drop_down),
                      style: const TextStyle(
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
                        // Utilisation du composent package utilisee comme props
                         Package(
                          title: "Messaging",
                          subTitle: "Avec le docteur",
                          money: money,
                          min: "en \$ /30min",
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
                        // Utilisation du composent package utilisee comme props
                         Package(
                          title: "Appel Vocal",
                          subTitle: "Avec le docteur",
                          money: money1,
                          min: "en \$ /30min",
                          listTitleColor: Colors.blue,
                          iconColors: const Color.fromRGBO(187, 222, 251,
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
                        // Utilisation du composent package utilisee comme props
                         Package(
                          title: "Appel Vidéo",
                          subTitle: "Avec le docteur",
                          money: money2,
                          min: "en \$ /30min",
                          listTitleColor: Colors.blue,
                          iconColors: const Color.fromRGBO(187, 222, 251, 1),
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
                        // Utilisation du composent package utilisee comme props
                        // pour consulter les fichiers Packages il suffit de faire ctrl + click sur Package au dessous
                        Package(
                          money: money3,
                          title: "En personne",
                          subTitle: "Avec le docteur",
                          min: "en \$ /30min",
                          listTitleColor: Colors.blue,
                          iconColors: const Color.fromRGBO(187, 222, 251, 1),
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

                // Bouton d'envoi pour stocker des données dans le sharedpreferences
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

//  Envoie des données dans le local storage avec sharedpreferences
void envoyerDuree() async {
  if (valueChoose == null || _value == 0) {
    // Afficher un dialogue d'erreur
    // Afficher un message d'erreur si la date ou l'heure n'a pas été sélectionnée.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Veuillez sélectionner une durée et un forfait.',
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

    prefs = await SharedPreferences.getInstance();

    // Sauvegarde de la durée et du forfait sélectionnés
    prefs.setString('selected_duration', valueChoose!);
    prefs.setInt('selected_package', _value);

    // Redirection vers la page Summary
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Patient()));
  }
}
