import 'package:doctor_app/components/card_image.dart';
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
  final List<Map<String, dynamic>> dummyHopital = [
    {
      'title': 'Dentist',
      'subTitle': 'ghjklkh',
      'subTitleBis': 'rtyu',
      'imageCard': const AssetImage("assets/salle.jpg"),
    },
    {
      'title': 'Dentist',
      'subTitle': 'ghjklkh',
      'subTitleBis': 'rtyu',
      'imageCard': const AssetImage("assets/salle.jpg"),
    },
    {
      'title': 'Dentist',
      'subTitle': 'ghjklkh',
      'subTitleBis': 'rtyu',
      'imageCard': const AssetImage("assets/salle.jpg"),
    },
    {
      'title': 'Dentist',
      'subTitle': 'ghjklkh',
      'subTitleBis': 'rtyu',
      'imageCard': const AssetImage("assets/salle.jpg"),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            padding: EdgeInsets.only(top: 5,right: 20),
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 35,
              ))
        ],
        leading: const Icon(
          Icons.place,
          color: Color.fromRGBO(21, 101, 192, 1),
          size: 40,
        ),
        title: const Text.rich(
          TextSpan(
            text: "localisation\n",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Dakar, Sénégal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, size: 30.0),
                  suffixIcon: IconButton(
                    icon: const Icon( Icons.filter_list, ),
                    onPressed: () {},
                    color: Colors.blue.shade800,
                    hoverColor: Colors.blue,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        color: Colors.white,
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
                                Icon(Icons.alarm,
                                    size: 25, color: Colors.white),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  dummyHopital.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardImage(
                      title: "${dummyHopital[index]['title']}",
                      subTitle: " ${dummyHopital[index]['subTitle']}",
                      subTitleBis: "${dummyHopital[index]['subTitleBis']}",
                      imageCard: dummyHopital[index]['imageCard'],
                    ),
                  ),
                ),
              ),
            ),

            // const CardImage(title: "teste", subTitle: "nojcv", subTitleBis: "dcbvpdskn", imageCard: AssetImage("assets/salle.jpg") ),
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
      ),
    );
  }
}
