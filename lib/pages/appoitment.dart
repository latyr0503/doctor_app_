import 'package:doctor_app/pages/selectpackage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Appoitment extends StatefulWidget {
  final String name;
  final String proffession;
  final String adresse;
  final String note;
  final String experience;
  const Appoitment(
      {Key? key,
      required this.name,
      required this.proffession,
      required this.adresse,
      required this.note,
      required this.experience});

  @override
  _AppoitmentState createState() => _AppoitmentState();
}

class _AppoitmentState extends State<Appoitment> {

  TextEditingController _dateController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TimeOfDay? time = TimeOfDay.now();
  bool isTimeChosen = false;

  void envoyerDateEtHeure() async {
    // final String nameMedecin = _controller.text;
    final String date = _dateController.text;

   if (date.isEmpty || !isTimeChosen) {
    // Afficher un message d'erreur si la date ou l'heure n'a pas été sélectionnée.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Veuillez sélectionner une date et une heure.', style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red, // Durée d'affichage du message
      ),
    );
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Rendez-vous pris avec succès!', style: TextStyle(fontSize: 15, color: Colors.black),),
      duration: Duration(seconds: 3), // Durée d'affichage du message de succès
      backgroundColor: Color.fromRGBO(187, 222, 251, 1), // Couleur d'arrière-plan du message de succès
    ),
  );

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
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectPackage()),
    );
  }

  

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Reservation',
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
            // const Details(),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 10),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/photos-gratuite/vue-face-homme-souriant-portant-blouse-laboratoire_23-2149633830.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=ais'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 70, left: 65),
                        child: const Icon(
                          Icons.assignment_turned_in_rounded,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.name,
                            style: const TextStyle(fontSize: 25.0)),
                        Text(widget.proffession,
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.grey)),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.blue,
                            ),
                            Text(
                              widget.adresse,
                              style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            const Icon(
                              Icons.map_sharp,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 35,
              endIndent: 35,
              height: 0,
            ),

            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.blue[800],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: Icon(
                        Icons.work,
                        size: 20,
                        color: Colors.blue[800],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.blue[800],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: Icon(
                        Icons.chat,
                        size: 20,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Column(
                        children: [
                          Text(
                            "7,500+",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Patients",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(
                            widget.experience,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "Années d'exp",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      child: Column(
                        children: [
                          Text(
                            widget.note,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "Note",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Column(
                        children: [
                          Text(
                            "4,596",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Revoir",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            // const MyAppli(),
            Container(
              margin: const EdgeInsets.only(top: 35, left: 33),
              child: const Text(
                "PRENDRE RENDEZ-VOUS",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: const Column(children: <Widget>[
                SizedBox(
                  height: 5,
                ),
              ]),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                const Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
               const SizedBox(height: 5),

                const Text(
                  'Heure',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                      margin: const EdgeInsets.only(top: 5),
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
                        backgroundColor: Colors.blue[100],
                        child: const Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
                      ),
                    ),
            ),






            const SizedBox(height: 20),




            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  hintText: 'Vous souhaitez un planning personnalisé ?',
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text('Calendrier des demandes'),
                  ),
                ),
              ),
            ),
                SizedBox(height: 30),


            Padding(
             padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      envoyerDateEtHeure();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 23),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Prendre rendez-vous',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
            ),
            const SizedBox(height: 50),

          ],
        ));
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
