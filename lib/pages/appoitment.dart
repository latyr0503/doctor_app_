import 'package:doctor_app/pages/selectpackage.dart';
import 'package:flutter/material.dart';

class Appoitment extends StatefulWidget {
  final String name;
  final String proffession;
  final String adresse;
  final String note;
  final String experience;
  const Appoitment(
      {Key? key,
      required this.name,
      required this.proffession,
      required this.adresse,
      required this.note,
      required this.experience});

  @override
  _AppoitmentState createState() => _AppoitmentState();
}

class _AppoitmentState extends State<Appoitment> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Reservation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: const BackButton(),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
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
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/photos-gratuite/vue-face-homme-souriant-portant-blouse-laboratoire_23-2149633830.jpg?size=626&ext=jpg&uid=R65302706&ga=GA1.1.1564638247.1697411010&semt=ais'),
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
                        Text(widget.name,
                            style: const TextStyle(fontSize: 25.0)),
                        Text(widget.proffession,
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
                              widget.adresse,
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
                            widget.experience,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "Années d'exp",
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
                            widget.note,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            "Note",
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
                            "Revoir",
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
            // const MyAppli(),
            Container(
              margin: const EdgeInsets.only(top: 35, left: 33),
              child: const Text(
                "PRENDRE RENDEZ-VOUS",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: const Column(children: <Widget>[
                SizedBox(
                  height: 5,
                ),
              ]),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  hintText: 'Vous souhaitez un planning personnalisé ?',
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text('Calendrier des demandes'),
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectPackage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Prendre un rendez-vous",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ));
  }
}
