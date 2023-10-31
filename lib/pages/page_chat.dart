import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/discuss.jpg'), // spécifiez votre image ici
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black
                .withOpacity(0.5), // spécifiez la couleur de l'overlay ici
            child: const Center(
              child: Text(
                'Désolé, cette page est momentanément indisponible',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
