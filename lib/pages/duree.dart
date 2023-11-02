import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Duree extends StatefulWidget {
  const Duree({Key? key}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Duree> {
  String? selectedDuration;
  int? selectedPackage;

  @override
  void initState() {
    super.initState();
    // Récupérez les valeurs à partir de SharedPreferences
    fetchSelectedValues();
  }

  Future<void> fetchSelectedValues() async {
    final prefs = await SharedPreferences.getInstance();
    selectedDuration = prefs.getString('selected_duration');
    selectedPackage = prefs.getInt('selected_package');
    setState(() {
      // Mettez à jour l'interface avec les valeurs récupérées
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duree'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Duration: $selectedDuration'),
            Text('Selected Package: ${getPackageName(selectedPackage)}'),
          ],
        ),
      ),
    );
  }

  String getPackageName(int? packageValue) {
    switch (packageValue) {
      case 1:
        return "Messaging";
      case 2:
        return "Appel Vocal";
      case 3:
        return "Appel Vidéo";
      case 4:
        return "En personne";
      default:
        return "Package non sélectionné";
    }
  }
}
