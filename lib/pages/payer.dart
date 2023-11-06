import 'package:doctor_app/pages/card_page/card_page.dart';
// import 'package:doctor_app/pages/review_summary.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Payer extends StatefulWidget {
  const Payer({Key? key}) : super(key: key);
  @override
  State<Payer> createState() => _PayerState();
}

class _PayerState extends State<Payer> {
  @override
  void initState() {
    super.initState();
  }

  // La création d'une boite de dialogue

  void _carte() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Card'),
            content: const Text('Voulez-vous confirmer votre payement?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CardPage()),
                  );
                },
                child: const Text("OK"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Payer()),
                  );
                },
                child: const Text("annuler"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Methodes de Payements',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      // Les trois methodes de payements
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // Input de visa
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // création de Card pour le visa 
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Credit & Debit Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent),
                  child: Center(
                    // le bouton Radio au niveau du champ de la carte Visa
                    child: Row(
                      children: [
                        const Icon(
                          Icons.fact_check_sharp,
                          color: Colors.blue,
                          size: 50,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('Add New Card',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54)),
                        const Spacer(),
                        MaterialButton(
                          onPressed: _carte,
                          child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Colors.blue,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // création de Card pour le paypal et apple pay 
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'More Payement Options',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent),
                  child: Center(
                    // insertion du logo de paypal
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          height: 40,
                          width: 40,
                          child: const Image(
                              image: AssetImage('assets/paypal.png')),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('Paypal',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54)),
                        const Spacer(),
                        // Bouton qui nous redirige dans le site paypal au niveau la page connexion
                        MaterialButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.paypal.com/signin'); // Remplacez l'URL par votre lien PayPal
                          },
                          child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Colors.blue,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                    // insertion du logo de paypal
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: Colors.black54),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(image: AssetImage('assets/apple.png')),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('Apple cash',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54)),
                        const Spacer(),
                        // Bouton qui nous redirige dans le site apple pay
                        MaterialButton(
                          onPressed: () {
                            _launchURLApple(
                                'https://www.apple.com/fr/apple-pay/'); // Remplacez l'URL par votre lien PayPal
                          },
                          child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Colors.blue,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //  Input de paypal
          ),
        ),
      ),
    );
  }
}

// // cette configuration est pour le premier site exemple paypal
void _launchURLApple(String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Impossible d\'ouvrir l\'URL $url';
  }
}

// cette configuration est pour le premier site exemple apple pay

void _launchURL(String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Impossible d\'ouvrir l\'URL $url';
  }
}
