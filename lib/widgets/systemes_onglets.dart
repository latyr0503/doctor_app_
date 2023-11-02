import 'package:doctor_app/widgets/ongletcinq.dart';
import 'package:doctor_app/widgets/ongletdeux.dart';
import 'package:doctor_app/widgets/ongletquatre.dart';
import 'package:doctor_app/widgets/onglettrois.dart';
import 'package:doctor_app/widgets/ongletun.dart';
import 'package:flutter/material.dart';

class SystemesOnglet extends StatelessWidget {
  const SystemesOnglet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: TabBar(
              isScrollable: true, // Permet le défilement horizontal
              tabs: [
                Tab(
                  child: Text('Traitements'),
                ),
                Tab(
                  child: Text('Spécialistes'),
                ),
                Tab(
                  child: Text('Gallery'),
                ),
                Tab(
                  child: Text('Review'),
                ),
                Tab(
                  child: Text('About'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20, // Espace entre la barre d'onglets et le contenu
          ),
          Expanded(
            child: TabBarView(
              children: [
                Traitement(),
                Specialiste(),
                Gallery(),
                Review(),
                About(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
