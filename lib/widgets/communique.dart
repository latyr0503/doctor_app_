import 'package:flutter/material.dart';

class Communiquer extends StatelessWidget {
  Communiquer({super.key});

  List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.web,
      'color': Colors.blue[800],
      'title': 'Website',
    },
    {
      'icon': Icons.message,
      'color': Colors.blue[800],
      'title': 'Message',
    },
    {
      'icon': Icons.call,
      'color': Colors.blue[800],
      'title': 'Call',
    },
    {
      'icon': Icons.map,
      'color': Colors.blue[800],
      'title': 'Direction',
    },
    {
      'icon': Icons.send,
      'color': Colors.blue[800],
      'title': 'Share',
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
            mainAxisAlignment: MainAxisAlignment.center, // Center the items vertically
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
                margin: EdgeInsets.only(top: 5),
                child: Text(value['title']),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
