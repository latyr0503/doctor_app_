import 'package:flutter/material.dart';

class Icone extends StatelessWidget {
  const Icone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[200],
              ),
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.blue[800],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[200],
              ),
              child: Icon(
                Icons.work,
                size: 20,
                color: Colors.blue[800],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[200],
              ),
              child: Icon(
                Icons.star,
                size: 20,
                color: Colors.blue[800],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[200],
              ),
              child: Icon(
                Icons.chat,
                size: 20,
                color: Colors.blue[800],
              ),
            ),
          ],
        ),

        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Column(
                children: [
                  Text(
                    "7,500+",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Patients",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Column(
                children: [
                  Text(
                    "10+",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Years Exp",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 10),
              child: const Column(
                children: [
                  Text(
                    "4,9+",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Rating",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Column(
                children: [
                  Text(
                    "4,596",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Review",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
