import 'package:doctor_app/components/doctor.dart';
import 'package:doctor_app/components/icone.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:flutter/material.dart';

class Details_doctor extends StatelessWidget {
  const Details_doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Builder(
                builder: (context) => Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                    )),
            title: const Center(
              child: Text(
                'Réservation',
              ),
            )),
        body: ListView(
          children: [
            const Details(),

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
            const Icone(),
            // const MyAppli(),
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
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text:
                      "hit test a render box that has never been laid out has never\nhit test laid a render box that has never been laid out \nhit test a render box that has never been laid out ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: 'Read more',
                  style: TextStyle(
                    color: Colors.blue, // Couleur du texte du bouton
                    fontSize: 16.0, // Taille du texte du bouton
                    decoration: TextDecoration
                        .underline, // Soulignement du texte du bouton
                  ),
                ),
              ])),
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
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Monday',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '00h00 - 00h00',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Tuesday',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '00h00 - 00h00',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Wednesday',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '00h00 - 00h00',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Thursday',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '00h00 - 00h00',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Friday',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '00h00 - 00h00',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Saturday',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '00h00 - 00h00',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Sunday',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '00h00 - 00h00',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Adress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View on Map'),
                  )
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

            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.blue),
                  Text(
                    '8502 Preston Rd. Inglewood, Maine 98380',
                    style: TextStyle(
                      fontSize: 18,
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
            Container(
              margin: const EdgeInsets.only(left: 28),
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.only(left: 5, right: 10, bottom: 10),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/docteur.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 30, left: 30),
                      child: const Icon(
                        Icons.assignment_turned_in_rounded,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text('Dr John Wilson',
                        style: TextStyle(fontSize: 15.0)),
                  ),
                  const Spacer(),
                  // ignore: avoid_unnecessary_containers

                  Container(
                    margin: const EdgeInsets.only(right: 30, bottom: 10),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text("5.0"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text(
                'Le lorem ipsum est, une suite signification Le lorem ipsum\n utilisée à titre provisoire pour calibrer',
                style: TextStyle(color: Colors.grey),
              ),
            ),

            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 30,
              endIndent: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 28),
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.only(left: 5, right: 10, bottom: 10),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/docteur.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 30, left: 30),
                      child: const Icon(
                       Icons.assignment_turned_in_rounded,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text('Dr John Wilson',
                        style: TextStyle(fontSize: 15.0)),
                  ),

                  const Spacer(),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: const EdgeInsets.only(right: 30, bottom: 10),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text("5.0"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text(
                'Le lorem ipsum est, une suite signification Le lorem ipsum\n utilisée à titre provisoire pour calibrer',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('assets/salle.jpg'),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('assets/salle.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
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
