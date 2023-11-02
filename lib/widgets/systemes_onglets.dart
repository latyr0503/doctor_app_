import 'package:flutter/material.dart';

class SystemesOnglet extends StatelessWidget {
  const SystemesOnglet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Système d\'onglets'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Onglet 1'),
              Tab(text: 'Onglet 2'),
              Tab(text: 'Onglet 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Contenu de l\'onglet 1')),
            Center(child: Text('Contenu de l\'onglet 2')),
            Center(child: Text('Contenu de l\'onglet 3')),
          ],
        ),
      ),
    );
  }
}
