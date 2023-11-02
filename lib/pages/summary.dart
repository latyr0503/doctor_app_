import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ReviewSummary extends StatefulWidget {
  @override
  _ReviewSummaryState createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  List<Map<String, String>> appointments = [];

  @override
  void initState() {
    super.initState();
    loadAppointments();
  }

  void loadAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAppointments = prefs.getStringList('saved_appointments') ?? [];
    appointments = savedAppointments.map((jsonString) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return Map<String, String>.from(jsonMap);
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Summary'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Container(
            child: Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('Date: ${appointment['date']}'),
                  Text( 'Heure: ${appointment['heure']}')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
