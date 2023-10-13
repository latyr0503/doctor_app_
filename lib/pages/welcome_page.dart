import 'package:doctor_app/components/card_speciality.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Welcome_page extends StatelessWidget {
  const Welcome_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              const Text(
                "Upcomming Schedule",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See All",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ],
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue.shade600,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape:
                              BoxShape.circle, // Utiliser une forme circulaire
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/plan-moyen-medecin-specialiste-bras-dans-poches-regardant-camera.jpg"),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Title(
                            color: Colors.black,
                            child: const Text(
                              "Dr Alana Ruete",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text(
                            "Dentist consultation",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        color: Colors.blue,
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        icon: const Icon(
                          Icons.phone_rounded,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue.shade800,
                        ),
                        width: 300.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.calendar_month,
                                    size: 25, color: Colors.white),
                                Text(
                                  "Monday, 26 july",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text('|',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                                Icon(Icons.alarm,
                                    size: 25, color: Colors.white),
                                Text("09:00 - 10:00",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Doctor Speciality",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See All",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ],
          ),
          const CardSpeciality(title: "latyr", images: AssetImage("assets/brain.png")),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Nearby Hospitals",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See All",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
              "Top Specialist",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See All",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
