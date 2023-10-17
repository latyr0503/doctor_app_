import 'package:doctor_app/components/doctor.dart';
import 'package:doctor_app/components/icone.dart';
import 'package:flutter/material.dart';

class Appoitment extends StatelessWidget {
  Appoitment({super.key});
  final categories = [
    {'day': "Today", 'jour': "4 Oct", 'heure': "7:00 PM"},
    {'day': "Mon", 'jour': "5 Oct", 'heure': "7:30 PM"},
    {'day': "Tue", 'jour': "6 Oct", 'heure': "8:00 PM"},
    {'day': "Wed", 'jour': "7 Oct",'heure': "8:30 PM"},
    {'day': "Thi", 'jour': "8 Oct",'heure': "9:00 PM"},
    {'day': "Fri", 'jour': "9 Oct", 'heure': "9:30 PM"},
    {'day': "Sun", 'jour': "10 Oct", 'heure': "10:00 PM"},
    {'day': "Sat", 'jour': "11 Oct", 'heure': "10:30 PM"},
  ];
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
                'Book Appointment',
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
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  color: Colors.white,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // Couleur de la bordure
                              width: 1.0, // Largeur de la bordure
                            ),
                            borderRadius: BorderRadius.circular(
                                30.0), // Rayon des coins arrondis
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(categories[index]['day'] as String),
                              Text(categories[index]['jour'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                            ],
                          ),
                        ),
                       
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 33,
                    ),
                    itemCount: categories.length,
                    
                  ),
                ),
                Container(
              margin: const EdgeInsets.only(right: 380, bottom: 10),
              child: const Text(
                "Time",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
               Container(
             
                  height: 80,
                  color: Colors.white,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // Couleur de la bordure
                              width: 1.0, // Largeur de la bordure
                            ),
                            borderRadius: BorderRadius.circular(
                                30.0), // Rayon des coins arrondis
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(categories[index]['heure'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            ],
                          ),
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                hintText: 'Want a custom Schedule ?',
                suffixIcon: TextButton(
                  onPressed: (){},
                  child: const Text('Request Schedule'),
                ),
              ),
),

            ),

            Container(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),

               child: ElevatedButton(
              onPressed: () {},
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
            SizedBox(height: 50)
          ],
          
        ));
  }
}
