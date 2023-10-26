import 'package:flutter/material.dart';

class JourModel {
  final String jour;
  final String heure_debut;
  final String heure_fin;

  // Add other properties of the "Jour" object

  JourModel({required this.jour, required this.heure_debut, required this.heure_fin,});
  // Add other constructor parameters

  factory JourModel.fromJson(Map<String, dynamic> json) {
    return JourModel(
      jour: json['jour'],
      heure_debut: json['heure_debut'],
      heure_fin: json['heure_fin'],

      // Map other properties from the JSON object
    );
  }
}




class Reservation extends StatelessWidget {
 final List<JourModel> jours;

  const Reservation({
    Key? key,
    required this.jours,
  }) : super(key: key);

 @override
Widget build(BuildContext context) {
  return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(jours[0].jour, style: TextStyle(fontSize: 16)),
                    Text(jours[0].heure_debut, style: TextStyle(fontSize: 14)),
                    Text(jours[0].heure_fin, style: TextStyle(fontSize: 14)),
                    
                  ],
                );
}
}
