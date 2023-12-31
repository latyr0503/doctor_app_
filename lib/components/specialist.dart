import 'package:doctor_app/pages/appoitment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Specialist extends StatelessWidget {
  final String? name;
  final String? proffession;
  final String? adresse;
  final double note;
  final int experience;
  final ImageProvider image;
  final VoidCallback onTap;

  const Specialist({
    Key? key,
    required this.name,
    required this.proffession,
    required this.note,
    this.image = const AssetImage("assets/doc2.jpg"),
    required Type id,
    required this.onTap,
    required this.experience,
    required this.adresse,
    required about,
    required jours,
    // required proffession,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Utilisez le callback onTap ici
      child: Container(
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: image,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 125,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 130,
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
                                  size: 12,
                                ),
                                Text(
                                  'Médecin professionnel',
                                  style: TextStyle(
                                    color: Color.fromRGBO(13, 71, 161, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
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
                                  text: name ?? "No Name",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            proffession.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: note.toDouble(),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Appoitment(
                                    proffession: proffession.toString(),
                                    adresse: adresse.toString(),
                                    note: note.toString(),
                                    experience: experience.toString(),
                                    name: name.toString()
                                    // Pass other necessary values here
                                    ),
                              ),
                            );
                            // print(proffession);
                            // print(adresse);
                            // print(note);
                            // print(name);
                            // print(experience);
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
      ),
    );
  }
}
