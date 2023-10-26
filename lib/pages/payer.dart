import 'package:doctor_app/pages/ajoutcard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Payer extends StatefulWidget {
  const Payer({super.key});

  @override
  State<Payer> createState() => _PayerState();
}

class _PayerState extends State<Payer> {
  final String _url = 'https://www.paypal.com/us/signin';

  @override
  void initState() {
    super.initState();
  }

  void _carte() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Card'),
            content: Text('Voulez-vous confirmer votre payement?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AjoutCard()),
                  );
                },
                child: Text("OK"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("annuler"),
              )
            ],
          );
        });
  }

  void _cash() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Par Cash'),
            content: Text('Voulez-vous confirmer votre payement?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AjoutCard()),
                  );
                },
                child: Text("OK"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("annuler"),
              )
            ],
          );
        });
  }

  void _launchUrl() async {
    throw Exception('Could not launch $_url');
  }

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          // Input de visa
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
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
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54)),
                        Spacer(),
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
                    // le bouton Radio au niveau du champ de la carte Visa
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 40,
                          width: 40,
                          child: Image(image: AssetImage('assets/paypal.png')),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        const Text('Paypal',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        Spacer(),
                        MaterialButton(
                          onPressed: _cash,
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
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent),
                  child: Center(
                    // le bouton Radio au niveau du champ de la carte Visa
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image(image: AssetImage('assets/apple.png')),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        const Text('Add New Card',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54)),
                        Spacer(),
                        MaterialButton(
                          onPressed: _cash,
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
