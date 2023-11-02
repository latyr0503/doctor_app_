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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text('Date',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey)),
              ),
              Container(
                child: Text(date,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text('Heure',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey)),
              ),
              Container(
                child: Text(heure,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
