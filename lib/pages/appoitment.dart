import 'package:doctor_app/components/doctor.dart';
import 'package:doctor_app/components/icone.dart';
import 'package:doctor_app/pages/reservation.dart';
import 'package:doctor_app/pages/selectpackage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Appoitment extends StatefulWidget {
  const Appoitment({Key? key});

  @override
  _AppoitmentState createState() => _AppoitmentState();
}

class _AppoitmentState extends State<Appoitment> {
   List<Map<String, dynamic>> rendezVous = [];
  // Votre fonction fetchSpecialists
  Future<List<Map<String, dynamic>>> fetchSpecialists() async {
    final response = await http.get(
        Uri.parse('https://doctor-app-h45i.onrender.com/doctor/list_doctor/'));
    if (response.statusCode == 200) {
      // Si la requête est réussie, convertissez la réponse en une liste de Map
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      // Si la requête échoue, lancez une exception.
      throw Exception('Échec de la récupération des données depuis l\'API');
    }
  }


  @override
  void initState() {
      super.initState();
    fetchSpecialists().then((data) {
      setState(() {
        // Mettez à jour votre liste de spécialistes avec les données obtenues
        rendezVous = data;
        print(rendezVous);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Reservation',
        style:  TextStyle(fontWeight: FontWeight.bold),),
        leading: BackButton(),
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
              indent: 35,
              endIndent: 35,
              height: 0,
            ),

            const SizedBox(
              height: 20,
            ),
            const Icone(),
            // const MyAppli(),
            Container(
              margin: const EdgeInsets.only(top: 35, left: 33),
              child: const Text(
                "BOOK APPOINTMENT",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            
            Container(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
              ]),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  hintText: 'Want a custom Schedule ?',
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text('Request Schedule'),
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SelectPackage()),
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
                  "Make Appointment",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50)
          ],
        ));
  }
}

