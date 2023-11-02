import 'package:flutter/material.dart';

class Choix extends StatelessWidget {
  final String name_medecin;


  const Choix({
    Key? key,
    required this.name_medecin,
   
    required Type id,
    // required proffession,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Center(
        
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(name_medecin),
                  ),   
                ],
              ),
            ],
        ),
      ),
    );
  }
}
