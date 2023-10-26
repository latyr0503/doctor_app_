import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final String name;
  final String proffession;
  final String adresse;
  final ImageProvider image;

  const Photo({
    Key? key,
    required this.name,
    required this.proffession,
    required this.adresse,
    required this.image,
    // required NetworkImage image,
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
                    margin: const EdgeInsets.all(10.0),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                      child: Image(
                        image: image,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 125,
                      ),
                  
                  ),
                  Container(
                    child: Text(name),
                  ),
                  Container(
                    child: Text(proffession),
                  ),
                  Container(
                    child: Text(adresse),
                  ),
                  
                ],
              ),
            ],
        ),
      ),
    );
  }
}
