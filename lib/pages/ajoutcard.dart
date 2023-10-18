import 'package:doctor_app/pages/add_card.dart';
import 'package:flutter/material.dart';

class AjoutCard extends StatelessWidget {
  const AjoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/visacarte.jpg'),
          ),
          AddCard(),
        ],
      ),
    );
  }
}
