import 'package:flutter/material.dart';

class Reviewe extends StatelessWidget {
  final String date;
  final String heure;



  const Reviewe({
    Key? key,
    required this.date,
    required this.heure,
    // required proffession,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Row(
          children: [
            Container(
              child: Text('Date'),
            ),
            Container(
              child: Text(date),
            ),
          ],
        ),

         Row(
          children: [
            Container(
              child: Text('Heure'),
            ),
            Container(
              child: Text(heure),
            ),
          ],
        )
      ],
    );
  }
}