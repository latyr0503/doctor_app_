import 'package:doctor_app/pages/introduction_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(248, 248, 248, 248),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
          const SizedBox(
            height: 75,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/Welcome 1.png"))),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              children: [
                Text(
                  "Votre application ultime de prise de rendez-vous chez le médecin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  "Prenez rendez-vous sans effort et gérez votre parcours de santé.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                CupertinoButton(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(50),
                  child: const Text("Let's Get Started"),
                  onPressed: () => onDone(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vous avez déjà un compte ?",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Se connecter',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 60.0)),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }

  void onDone(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => IntroScreen(),
      ),
    );
  }
}
