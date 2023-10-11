import 'package:doctor_app/pages/home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Welcome_page extends StatelessWidget {
  const Welcome_page({super.key});

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
            child: const Text('')
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Bienvenue dans la page d'acceuil",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(21, 101, 192, 1)),
        ),
      ),
    );
  }
}
