import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20, right: 10),
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/docteur.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 70, left: 65),
                child: const Icon(
                  Icons.assignment_turned_in_rounded,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Dr John Wilson', style: TextStyle(fontSize: 25.0)),
                Text('Dentist',
                    style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.blue,
                    ),
                    Text(
                      'New York, United States',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.normal),
                    ),
                    Icon(
                      Icons.map_sharp,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
