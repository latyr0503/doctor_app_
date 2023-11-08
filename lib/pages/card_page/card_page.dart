import 'dart:convert';

import 'package:doctor_app/pages/card_page/summaryPage.dart';
import 'package:doctor_app/pages/review_summary.dart';
import 'package:doctor_app/pages/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'card/credit_card.dart';
import 'formatters/index.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
Future<bool> sendCreditCardInfoToDjango() async {
  try {
    // Ici, vous devez écrire le code pour envoyer les données à votre API Django.
    // Vous devrez utiliser la bibliothèque http pour effectuer une requête POST vers votre API.
    // Si l'envoi réussit, vous devez renvoyer true, sinon renvoyez false en cas d'échec.

    // Exemple fictif de code (il faut l'adapter à votre API Django) :
    final response = await http.post(
      Uri.parse('https://votre-api-django.com/endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'username': _nameCTRL.text,
        'backcvv': _cvvCTRL.text,
        'fontnumber': _noCTRL.text,
        'fontexp': _expCTRL.text,
      }),
    );

    if (response.statusCode == 201) {
      // L'envoi a réussi.
      return true;
    } else {
      // L'envoi a échoué.
      return false;
    }
  } catch (e) {
    // En cas d'erreur lors de l'envoi.
    return false;
  }
}

  late TextEditingController _nameCTRL;
  late TextEditingController _cvvCTRL;
  late TextEditingController _noCTRL;
  late TextEditingController _expCTRL;
  late SharedPreferences _preferences;

  @override
  void initState() {
    super.initState();
    _nameCTRL = TextEditingController();
    _cvvCTRL = TextEditingController();
    _noCTRL = TextEditingController();
    _expCTRL = TextEditingController();

    SharedPreferences.getInstance().then((preferences) {
      setState(() {
        _preferences = preferences;
        _nameCTRL.text = _preferences.getString('username') ?? '';
        _cvvCTRL.text = _preferences.getString('backcvv') ?? '';
        _noCTRL.text = _preferences.getString('fontnumber') ?? '';
        _expCTRL.text = _preferences.getString('fontexp') ?? '';
      });
    });
  }

  @override
  void dispose() {
    _nameCTRL.dispose();
    _cvvCTRL.dispose();
    _noCTRL.dispose();
    _expCTRL.dispose();
    super.dispose();
  }

  Widget input({
    required String placeHolder,
    required TextEditingController controller,
    required List<TextInputFormatter> formatters,
  }) {
    return TextFormField(
      inputFormatters: formatters,
      onChanged: (value) {
        setState(() {});
      },
      controller: controller,
      style: const TextStyle(
        fontSize: 13,
      ),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey, letterSpacing: 1),
        hintText: placeHolder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 176, 176, 176),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 220, 220, 220),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordonnees bancaire'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CreditCard(
                  name: _nameCTRL.text,
                  cvv: _cvvCTRL.text,
                  number: _noCTRL.text,
                  expiry: _expCTRL.text,
                ),
                const SizedBox(height: 50),
                Form(
                  child: Column(
                    children: [
                      input(
                        placeHolder: 'Entrez votre prénom et nom',
                        controller: _nameCTRL,
                        formatters: [],
                      ),
                      const SizedBox(height: 10),
                      input(
                        placeHolder: 'Numero de carte',
                        controller: _noCTRL,
                        formatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                          LengthLimitingTextInputFormatter(19),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: input(
                              formatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                EXPFormatter(),
                              ],
                              placeHolder: "Date d'expiration (MM/DD)",
                              controller: _expCTRL,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Flexible(
                            child: input(
                              formatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                              placeHolder: 'CVV',
                              controller: _cvvCTRL,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () async {
                          final username = _nameCTRL.text;
                          final backcvv = _cvvCTRL.text;
                          final fontnumber = _noCTRL.text;
                          final fontexp = _expCTRL.text;
                          await _preferences.setString('username', username);
                          await _preferences.setString('backcvv', backcvv);
                          await _preferences.setString('fontnumber', fontnumber);
                          await _preferences.setString('fontexp', fontexp);
                          await sendCreditCardInfoToDjango();
                          // ignore: use_build_context_synchronously
 // Envoyer les données à l'API Django
    // bool dataSentSuccessfully = await sendCreditCardInfoToDjango();

    // if (dataSentSuccessfully) {
      print('Les données ont été envoyées avec succès, naviguez vers la page de validation');
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Summary()));
    // } else {
    //   // Les données n'ont pas été envoyées avec succès, affichez un message d'erreur ou effectuez une autre action appropriée
    //   // Par exemple, affichez un dialogue d'erreur.
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: const Text('Erreur'),
    //         content: const Text('Les données n\'ont pas pu être envoyées. Veuillez réessayer.'),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child: const Text('Fermer'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade800,
                        ),
                        child: Center(
                          child: Text(
                            'Payer'.toUpperCase(),
                            style: const TextStyle(
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 3,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
