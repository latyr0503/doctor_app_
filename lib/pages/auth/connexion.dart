import 'package:doctor_app/components/spacement_styles.dart';
import 'package:doctor_app/pages/auth/inscription.dart';
import 'package:doctor_app/pages/auth/reset_pass_word.dart';
import 'package:doctor_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

// ignore: must_be_immutable
class Connexion extends StatelessWidget {
  Connexion({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn(
      BuildContext context, String name, String password, String email) async {
    try {
      // ignore: prefer_typing_uninitialized_variables
      var response = await post(
        Uri.parse('https://doctor-app-h45i.onrender.com/users/login/'),
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print("Connexion réussie");
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Welcome_page()),
        );
      } else {
        print("Échec de la connexion");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Connexion",
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w400,
                        height: 2.0),
                  ),
                  Text(
                    "Salut ! Bienvenue à nouveau, vous nous avez manqué",
                    textAlign: TextAlign.center,
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
                  const Padding(padding: EdgeInsets.all(20.0)),
                  // Email
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  // mot de passe
                  const Padding(padding: EdgeInsets.all(20.0)),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      labelText: 'Mot de passe',
                    ),
                  ),
                  // mot de passe oublier
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Padding(padding: EdgeInsets.all(30.0)),
                      // Text("mot de passe oublié")
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResetPassWord()),
                          );
                        },
                        child: const Text('Mot de passe oublié ?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                    ],
                  ),
                  CupertinoButton(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(50),
                    onPressed: () {
                      signIn(context, nameController.text,
                          passwordController.text, emailController.text);
                    },
                    padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                    child: const Text("Se connecter"),
                  ),
                ],
              )),
              const Padding(padding: EdgeInsets.all(20.0)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Divider(
                    color: Colors.black,
                    thickness: 0.3,
                    endIndent: 10,
                  )),
                  Text("se connecter avec"),
                  Flexible(
                      child: Divider(
                    color: Colors.black,
                    thickness: 0.3,
                    indent: 10,
                  )),
                ],
              ),
              const Padding(padding: EdgeInsets.all(15.0)),

              // social icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: 25,
                          height: 25,
                          image: AssetImage("assets/apple.png")),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: 25,
                          height: 25,
                          image: AssetImage("assets/google.png")),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: 25,
                          height: 25,
                          image: AssetImage("assets/facebook.png")),
                    ),
                  ),
                ],
              ),
              // lien inscription
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous n'avez pas de compte ?",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Inscription()),
                      );
                    },
                    child: const Text("S'inscrire",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 70.0)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
