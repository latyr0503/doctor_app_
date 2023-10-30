import 'package:doctor_app/components/commentaire_detail.dart';
import 'package:doctor_app/components/day_hours.dart';
import 'package:doctor_app/pages/appoitment.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Details_doctor extends StatelessWidget {
  final String name;
  final String proffession;
  final String adresse;
  final String about;
  final String note;
  final String experience;
  final ImageProvider imageProvider;
  // final List<Map<String, dynamic>> jours;
  Details_doctor({
    super.key,
    required this.name,
    required this.proffession,
    required this.adresse,
    required this.about,
    required this.note,
    required this.experience,
    required this.imageProvider,
    // required this.jours,
  });
  final List<Map<String, dynamic>> dummyHourWork = [
    {
      "day": 'Lundi',
      "heuresOne": "08:00",
      "heuresTwo": "17:00",
    },
    {
      "day": 'Mardi',
      "heuresOne": "08:00",
      "heuresTwo": "17:00",
    },
    {
      "day": 'Mercredi',
      "heuresOne": "08:00",
      "heuresTwo": "17:00",
    },
    {
      "day": 'Jeudi',
      "heuresOne": "08:00",
      "heuresTwo": "17:00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // print(imageUrl);
    // Liste de spécialistes
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text(
            'Réservation',
          ),
        )),
        body: ListView(
          children: [
            // const Details(),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 10),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 70, left: 65),
                        child: const Icon(
                          Icons.assignment_turned_in_rounded,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name, style: const TextStyle(fontSize: 25.0)),
                        Text(proffession,
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.grey)),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.blue,
                            ),
                            Text(
                              adresse,
                              style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            const Icon(
                              Icons.map_sharp,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 35,
              endIndent: 35,
              height: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            // const Icone(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.blue[800],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: Icon(
                        Icons.work,
                        size: 20,
                        color: Colors.blue[800],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.blue[800],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: Icon(
                        Icons.chat,
                        size: 20,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Column(
                        children: [
                          Text(
                            "7,500+",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Patients",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(
                            experience,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "Years Exp",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      child: Column(
                        children: [
                          Text(
                            note,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "Rating",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Column(
                        children: [
                          Text(
                            "4,596",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Review",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 35, left: 33),
              child: const Text(
                "About ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 30, bottom: 15),
              child: Text(about),
            ),
            Container(
              margin: const EdgeInsets.only(left: 33),
              child: const Text(
                "Working Hours ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 30,
              endIndent: 30,
            ),

            Column(
              children: dummyHourWork.map((dateHour) {
                return DateHours(
                  day: dateHour['day'],
                  heuresOne: dateHour['heuresOne'],
                  heuresTwo: dateHour['heuresTwo'],
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Adresse',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 32,
              endIndent: 35,
              height: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(Icons.location_on, color: Colors.blue),
                  Text(
                    adresse.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  hintText: 'Sarch in Review',
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {},
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
            ),
            const CommentaireDetail(),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 30,
              endIndent: 30,
            ),
            const CommentaireDetail(),

            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
              child: ElevatedButton(
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
                  print(proffession);
                  print(adresse);
                  print(note);
                  print(name);
                  print(experience);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Réservation",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
