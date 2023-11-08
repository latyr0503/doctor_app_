import 'package:doctor_app/pages/review_summary.dart';
import 'package:doctor_app/pages/selectpackage.dart';
import 'package:doctor_app/pages/sum.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expireController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool isChecked = false;

  void submit(String a) {
    setState(() {
      // Mise à jour du message
      // ...
    });
  }

  void envoyerCard() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAppointments = prefs.getStringList('saved_appointments') ?? [];

    final String name = _nameController.text;
    final String number = _numberController.text;
    final String expire = _expireController.text;
    final String cvv = _cvvController.text;

    final appointment = {
      'name': name,
      'number': number,
      'expire': expire,
      'cvv': cvv,
    };
   
    if (name.isEmpty || number.isEmpty || expire.isEmpty || cvv.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs.', style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final appointmentJson = jsonEncode(appointment);
    savedAppointments.add(appointmentJson);

    await prefs.setStringList('saved_appointments', savedAppointments);

    _nameController.clear();
    _numberController.clear();
    _expireController.clear();
    _cvvController.clear();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Summ()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/visa.png'),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Card Holder Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Esther Howar',
              ),
              keyboardType: TextInputType.text,
              autocorrect: true,
              autofocus: true,
              onSubmitted: submit,
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Card Number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '3536 3332 8383 2309',
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Expiration Date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _expireController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: '02/30',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'CVV',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _cvvController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: '000',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    'Save Card',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
                        SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  envoyerCard();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Add Card",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
