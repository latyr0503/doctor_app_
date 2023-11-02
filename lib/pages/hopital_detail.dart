import 'package:doctor_app/widgets/communique.dart';
import 'package:flutter/material.dart';

class HopitalDetail extends StatefulWidget {
  const HopitalDetail({Key? key}) : super(key: key);

  @override
  State<HopitalDetail> createState() => _HopitalDetailState();
}

class _HopitalDetailState extends State<HopitalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image(
                  image: AssetImage('assets/hop.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const BackButton(),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          print('partager');
                        },
                        icon: const Icon(Icons.share),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          print('favorie');
                        },
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(MediaQuery.of(context).size.width * 0.3,
                            -MediaQuery.of(context).size.height * 0.05),
                        child: Container(
                          width: 145,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.verified,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                size: 15,
                              ),
                              Text(
                                'Médecin professionnel',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        "Hopital principal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        "Hopital principal",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black38,
                          fontSize: 18,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Text(
                            "adresse de l'hopital",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      const Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Text(
                            "adresse de l'hopital",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      Communiquer(),
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
