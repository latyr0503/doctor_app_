import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Specialist extends StatelessWidget {
  final String name;
  final String profession;
  final double note;
  final ImageProvider imageProf;

  const Specialist({
    Key? key,
    required this.name,
    required this.profession,
    required this.note,
    this.imageProf = const AssetImage("assets/salle.jpg"),
  }) : super(key: key);
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
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                        image: imageProf,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
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
                                size: 13,
                              ),
                              Text(
                                'Médecin professionnel',
                                style: TextStyle(
                                  color: Color.fromRGBO(13, 71, 161, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: 'Dr. ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          profession,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: note,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 240, 144, 0),
                              ),
                              itemCount: 5,
                              itemSize: 13.0,
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              note.toString(),
                              style: const TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
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
