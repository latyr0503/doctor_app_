import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  late String username;
  late String backcvv;
  late String fontnumber;
  late String fontexp;

  @override
  void initState() {
    super.initState();

    // Initialisation de SharedPreferences pour récupérer les données sauvegardées
    SharedPreferences.getInstance().then((preferences) {
      setState(() {
        username = preferences.getString('username') ?? '';
        backcvv = preferences.getString('backcvv') ?? '';
        fontnumber = preferences.getString('fontnumber') ?? '';
        fontexp = preferences.getString('fontexp') ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Résumé'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Nom d\'utilisateur: $username'),
            Text('CVV: $backcvv'),
            Text('Numéro de carte: $fontnumber'),
            Text('Date d\'expiration: $fontexp'),
            // Vous pouvez utiliser ces valeurs comme bon vous semble dans cette page.
          ],
        ),
      ),
    );
  }
}
