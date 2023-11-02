import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Summ extends StatefulWidget {
  @override
  _SummState createState() => _SummState();
}

class _SummState extends State<Summ> {
  List<Map<String, String>> savedAppointments = [];

  @override
  void initState() {
    super.initState();
    loadSavedAppointments();
  }

  Future<void> loadSavedAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAppointmentsJson = prefs.getStringList('saved_appointments') ?? [];

    setState(() {
      savedAppointments = savedAppointmentsJson
          .map((appointmentJson) => jsonDecode(appointmentJson))
          .cast<Map<String, String>>()
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résumé'),
      ),
      body: ListView.builder(
        itemCount: savedAppointments.length,
        itemBuilder: (context, index) {
          final appointment = savedAppointments[index];
          return ListTile(
            title: Text('Card Holder Name: ${appointment['name']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Card Number: ${appointment['number']}'),
                Text('Expiration Date: ${appointment['expire']}'),
                Text('CVV: ${appointment['cvv']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
