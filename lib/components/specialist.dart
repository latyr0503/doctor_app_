import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Specialist extends StatelessWidget {
  const Specialist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Center(
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 100,
                    height: 125,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/plan-moyen-medecin-specialiste-bras-dans-poches-regardant-camera.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.verified,
                                color: Color.fromRGBO(13, 71, 161, 1),
                                size: 15,
                              ),
                              Text(
                                'Médecin professionnel',
                                style: TextStyle(
                                  color: Color.fromRGBO(13, 71, 161, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Dr. Latyr Sene',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Dentist',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: 4.5,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 240, 144, 0),
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '| 49 reviews',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.only(
                    bottom: 15.0, left: 15.0, right: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Ajoutez votre logique pour le long bouton ici
                        },
                        child: const Text(
                          'Prendre Un Rendez-Vous',
                          style: TextStyle(
                            color: Color.fromRGBO(13, 71, 161, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
