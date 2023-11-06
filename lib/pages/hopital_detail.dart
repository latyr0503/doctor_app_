import 'package:doctor_app/widgets/communique.dart';
import 'package:flutter/material.dart';

class HopitalDetail extends StatefulWidget {
  final String name;
  final String date;
  final String adresse;

  const HopitalDetail({
    Key? key,
    required this.name,
    required this.date,
    required this.adresse,
  }) : super(key: key);
  @override
  State<HopitalDetail> createState() => _HopitalDetailState();
}

class _HopitalDetailState extends State<HopitalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              print('share');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              print('favori');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          const Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image(
                  image: AssetImage('assets/hop.png'),
                  fit: BoxFit.cover,
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
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        "(dermatologie, médecine générale, ophtalmologie..._)",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black38,
                          fontSize: 15,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Text(
                            widget.adresse,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_filled,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Text(
                            widget.date,
                            style: const TextStyle(
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
