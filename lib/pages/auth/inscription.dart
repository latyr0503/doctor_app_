import 'package:doctor_app/components/spacement_styles.dart';
import 'package:doctor_app/pages/auth/connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InscriptionState createState() => _InscriptionState();
}

bool isChecked = false;
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void signup(BuildContext context ,String name, String password, String email) async {
  try {
    // ignore: prefer_typing_uninitialized_variables
    var response = await post(
      Uri.parse('https://doctor-app-h45i.onrender.com/users/create-user/'),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 201) {
      // ignore: avoid_print
      print("Inscription réussie");
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Connexion()),
      );
    } else {
      print("Échec de l'inscription");
    }
  } catch (e) {
    print(e.toString());
  }
}

class _InscriptionState extends State<Inscription> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Column(
                children: [
                  Text(
                    "Creer Un Compte",
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w400,
                        height: 2.0),
                  ),
                  Text(
                    "Remplissez vos informations ci-dessous ou inscrivez-vous avec votre compte social.",
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
                  const Padding(padding: EdgeInsets.all(15.0)),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: " Entrez votre nom complet",
                      labelText: 'Nom Complet',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  // Email
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: " Entrez votre email complet",
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  // mot de passe
                  const Padding(padding: EdgeInsets.all(10.0)),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      labelText: 'Mot de passe',
                      hintText: " Entrez un mot de passe bien sécurisé",
                    ),
                  ),
                  // mot de passe oublier
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 30.0, bottom: 30.0)),
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text("accepter les"),
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(5, 5, 5, 5)),
                        ),
                        child: const Text('Termes et Conditions',
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
                      signup(context,nameController.text, passwordController.text,
                          emailController.text);
                    },
                    padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                    child: const Text("S'Inscrire"),
                  ),
                ],
              )),
              const Padding(padding: EdgeInsets.all(10.0)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Divider(
                    color: Colors.black,
                    thickness: 0.3,
                    endIndent: 10,
                  )),
                  Text("s'inscrire avec"),
                  Flexible(
                      child: Divider(
                    color: Colors.black,
                    thickness: 0.3,
                    indent: 10,
                  )),
                ],
              ),
              const Padding(padding: EdgeInsets.all(10.0)),

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
                    "Vous avez déjà un compte ?",
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
                            builder: (context) => Connexion()),
                      );
                    },
                    child: const Text("Se Connecter",
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
