import 'package:doctor_app/components/spacement_styles.dart';
import 'package:flutter/material.dart';

class Connexion extends StatelessWidget {
  const Connexion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Connexion",
                    style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w400,
                        height: 2.0),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Salut ! Bienvenue à nouveau, vous nous avez manqué",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Color.fromRGBO(117, 117, 117, 1),
                    ),
                  ),
                ],
              ),
              Form(
                  child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(20.0)),
                  // Email
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  // mot de passe
                  Padding(padding: EdgeInsets.all(20.0)),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      labelText: 'Mot de passe',
                    ),
                  ),
                  // mot de passe oublier
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("connexion auto"),
                        ],
                      )
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
