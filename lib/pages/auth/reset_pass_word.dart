import 'package:doctor_app/components/spacement_styles.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassWord extends StatelessWidget {
  const ResetPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('')),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Code de Vérification",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        height: 2.0),
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: "Please entrer the code we just sent to email ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Color.fromRGBO(117, 117, 117, 1),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'exemple@gmail.com',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(21, 101, 192, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Form(
                  child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(20.0)),
                  // Email
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Code de validation',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(20.0)),
                  const Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: "Je n'ai pas reçu de message ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Color.fromRGBO(117, 117, 117, 1),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nrenvoyer le code',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(21, 101, 192, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(20.0)),

                  // mot de passe oublier
                  CupertinoButton(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(50),
                    onPressed: () => (),
                    padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                    child: const Text("Vérifier"),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
