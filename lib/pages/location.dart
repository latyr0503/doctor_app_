import 'package:doctor_app/pages/accesslocation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Page Localisation
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<String> countries = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  void fetchCountries() async {
    final response = await http
        .get(Uri.parse('https://restcountries.com/v3.1/all?fields=name'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<String> countryNames = [];
      for (var countryData in data) {
        countryNames.add(countryData['name']
            ['common']); // Utilisez 'common' pour obtenir le nom du pays
      }

      setState(() {
        countries = countryNames;
      });
    }
  }

  List<String> searchResults = [];

  void searchCountries(String query) {
    query = query.toLowerCase();
    List<String> matches = [];
    for (String country in countries) {
      if (country.toLowerCase().contains(query)) {
        matches.add(country);
      }
    }

    setState(() {
      searchResults = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // le appbar de la page
      appBar: AppBar(
          leading: const BackButton(),
          title: const Text(
              'Entrer votre localisation',
          ),
            centerTitle: true
          ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: searchController,
              onChanged: (text) {
                debugPrint(text);
                searchCountries(text);
                if(text.isEmpty){
                  setState(() {
                    searchResults.clear();
                  });
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                hintText: 'Senegal',
                prefixIcon: const Icon(Icons.search, size: 25.0,
                    color: Color.fromRGBO(21, 101, 192, 1),
                 ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    // Effacez tous les éléments de la barre de recherche
                    searchController.clear();

                    // Réinitialisez la liste des résultats
                    setState(() {
                      searchResults.clear();
                    });
                  },
                  color: Colors.blue.shade800,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10, right: 10),
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
            indent: 20,
            endIndent: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: const Text(
              'Cherchez votre localisation',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.grey),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.near_me_sharp,
                      size: 20,
                      color: Color.fromRGBO(21, 101, 192, 1),
                    ),
                    title: Text(searchResults[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
