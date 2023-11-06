import 'package:doctor_app/pages/review_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CardPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CardPage({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late TextEditingController _nameController;
  // late TextEditingController _nameController;
  late TextEditingController _cvvCTRL;
  late TextEditingController _noCTRL;
  late TextEditingController _expCTRL;

  @override
  void initState() {
    _nameController = TextEditingController();
    _cvvCTRL = TextEditingController();
    _noCTRL = TextEditingController();
    _expCTRL = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cvvCTRL.dispose();
    _noCTRL.dispose();
    _expCTRL.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 50),
                Form(
                    child: Column(
                  children: [
                    const TextField(
                      // controller: _nameController,
                      decoration: InputDecoration(
                        hintText: " Entrez votre prenom et nom",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black38)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    input(
                      placeHolder: 'Numero de carte',
                      controller: _noCTRL,
                      formatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(19)
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
                          ],
                          placeHolder: "Date d'expiration (MM/DD)",
                          controller: _expCTRL,
                        )),
                        const SizedBox(width: 15),
                        Flexible(
                          child: input(
                            formatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3)
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
                        final response = await http.post(
                          Uri.parse('https://doctor-app-h45i.onrender.com/rendez_vous/create_carte/'), // Remplacez par l'URL de votre backend Django.
                          body: {
                            'card_name': _nameController.text,
                            'card_number': _noCTRL.text,
                            'expiry_date': _expCTRL.text,
                            'cvv': _cvvCTRL.text,
                          },
                        );

                        if (response.statusCode == 201) {
                          // La création du paiement a réussi.
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Summary()));
                        } else {
                          // Gérez les erreurs en conséquence.
                        }
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
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
