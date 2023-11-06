import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Communiquer extends StatelessWidget {
  Communiquer({super.key});

  List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.web,
      'color': Colors.blue[800],
      'title': 'Site Web',
    },
    {
      'icon': Icons.message,
      'color': Colors.blue[800],
      'title': 'Message',
    },
    {
      'icon': Icons.call,
      'color': Colors.blue[800],
      'title': 'Telephone',
    },
    {
      'icon': Icons.map,
      'color': Colors.blue[800],
      'title': 'Localisation',
    },
    {
      'icon': Icons.send,
      'color': Colors.blue[800],
      'title': 'Partager',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // utilisation du mapp de listes
        children: categories.map((value) {
          return Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the items vertically
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(187, 222, 251, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Icon(value['icon'], color: value['color']),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(value['title']),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
