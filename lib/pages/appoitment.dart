import 'package:doctor_app/components/doctor.dart';
import 'package:doctor_app/components/icone.dart';
import 'package:doctor_app/pages/selectpackage.dart';
import 'package:flutter/material.dart';

class Appoitment extends StatelessWidget {
  Appoitment({super.key});
  final categories = [
    {'day': "Today\n4 Oct", 'heure': "7:00 PM"},
    {'day': "Mon\n5 Oct", 'heure': "7:30 PM"},
    {'day': "Tue\n6 Oct", 'heure': "8:00 PM"},
    {'day': "Wed\n7 Oct", 'heure': "8:30 PM"},
    {'day': "Thi\n8 Oct", 'heure': "9:00 PM"},
    {'day': "Fri\n9 Oct", 'heure': "9:30 PM"},
    {'day': "Sun\n10 Oct", 'heure': "10:00 PM"},
    {'day': "Sat\n11 Oct", 'heure': "10:30 PM"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Reservation',
        style:  TextStyle(fontWeight: FontWeight.bold),),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
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
                "BOOK APPOINTMENT",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 33),
              child: const Text(
                "Day",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(categories[index]['day'] as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 33,
                    ),
                    itemCount: categories.length,
                  ),
                ),
              ]),
            ),

            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 30,
              ),
              child: const Text(
                "Time",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                categories[index]['heure'] as String,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 33,
                    ),
                    itemCount: categories.length,
                  ),
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
                  hintText: 'Want a custom Schedule ?',
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text('Request Schedule'),
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
                        MaterialPageRoute(
                            builder: (context) =>  SelectPackage()),
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
                  "Make Appointment",
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
