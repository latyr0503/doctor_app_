import 'package:flutter/material.dart';

class DateHours extends StatelessWidget {
  final String day;
  final String heuresOne;
  final String heuresTwo;

  const DateHours(
      {Key? key,
      required this.day,
      required this.heuresOne,
      required this.heuresTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            day,
            style: const TextStyle(fontSize: 15.0),
          ),
          Text(
            '$heuresOne - $heuresTwo',
            style: const TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
