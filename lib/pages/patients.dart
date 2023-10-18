import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  Patient({Key? key}) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  String? valueChoose;
  List<String> listItem = ['item1', 'item2', 'item3', 'item4', 'item5'];

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
        title: Center(
          child: Text('Patient Details'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 30),
            Container(
              child: Text('Booking for'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: EdgeInsets.only(left: 340),
                  child: DropdownButton<String>(
                    hint: Text('Male'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.arrow_drop_down),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    value: valueChoose,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Gender'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                   margin: EdgeInsets.only(left: 340),
                  child: DropdownButton<String>(
                    hint: Text('30min'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.arrow_drop_down),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    value: valueChoose,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Your Age'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: EdgeInsets.only(left: 326),
                  child: DropdownButton<String>(
                    hint: Text('24 years'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.arrow_drop_down),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    value: valueChoose,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Write your problem'),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: TextField(
                maxLines: 5, // Maximum number of lines
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                ),
                onChanged: (text) {
                  // Handle the text input here
                },
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Réservation",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
