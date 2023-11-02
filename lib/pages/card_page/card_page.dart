import 'package:doctor_app/pages/review_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'card/credit_card.dart';
import 'formatters/index.dart';
import 'package:http/http.dart' as http;


class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late TextEditingController _cvvCTRL;
  late TextEditingController _noCTRL;
  late TextEditingController _expCTRL;

  @override
  void initState() {
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
                CreditCard(
                  cvv: _cvvCTRL.text,
                  number: _noCTRL.text,
                  expiry: _expCTRL.text,
                ),
                const SizedBox(height: 50),
                Form(
                    child: Column(
                  children: [
                    input(
                      placeHolder: 'Numero de carte',
                      controller: _noCTRL,
                      formatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberFormatter(),
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
                            EXPFormatter()
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
                Uri.parse('https://votre-domaine.com/api/create_payment/'), // Remplacez par l'URL de votre backend Django.
                body: {
                  'card_number': _noCTRL.text,
                  'expiry_date': _expCTRL.text,
                  'cvv': _cvvCTRL.text,
                },
              );

              if (response.statusCode == 201) {
                // La création du paiement a réussi.
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
