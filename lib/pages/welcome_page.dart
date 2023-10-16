import 'package:flutter/material.dart';
import 'package:doctor_app/components/card_speciality.dart';

// ignore: camel_case_types
class Welcome_page extends StatelessWidget {
  Welcome_page({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> dummySpecialities = [
    {
      'title': 'Dentist',
      'images': const AssetImage('assets/tooth.png'),
    },
    {
      'title': 'Cardiology',
      'images': const AssetImage('assets/cardio.png'),
    },
    {
      'title': 'Orthopaedie',
      'images': const AssetImage('assets/join.png'),
    },
    {
      'title': 'Neurologie',
      'images': const AssetImage('assets/brain.png'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              const Text(
                "Upcoming Schedule",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
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
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/plan-moyen-medecin-specialiste-bras-dans-poches-regardant-camera.jpg"),
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr Alana Ruete",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Dentist consultation",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.blue,
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
                                "Monday, 26 July",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Icon(Icons.alarm, size: 25, color: Colors.white),
                              Text(
                                "09:00 - 10:00",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                "Doctor Speciality",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: dummySpecialities.map((speciality) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardSpeciality(
                    title: speciality['title'],
                    images: speciality['images'],
                  ),
                );
              }).toList(),
            ),
          ),
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
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
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
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
