import 'package:doctor_app/pages/accesslocation.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
              builder: (context) => Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccessLocation()),
                        );
                      },
                    ),
                  )),
          title: const Center(
            child: Text(
              'Entrer votre localisation',
            ),
          )),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                hintText: 'Golden Avenue',
                prefixIcon: const Icon(Icons.search, size: 30.0),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                  color: Colors.blue.shade800,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.near_me_sharp,
                    size: 25,
                    color: Color.fromRGBO(21, 101, 192, 1),
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
                const Text(
                  'Use my current location',
                  style: TextStyle(
                  fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 30,
            endIndent: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: const Text(
              'SEARCH RESULT',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.near_me_sharp,
                    size: 20,
                    color: Color.fromRGBO(21, 101, 192, 1),
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
                const Text(
                  'Golden Avenue',
                  style: TextStyle(
                  fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: const Text(
              '8502 Preston Rd. inglbold.',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.grey),
            ),
          ),

        ],
      ),
    );
  }
}
