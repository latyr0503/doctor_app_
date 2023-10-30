import 'package:flutter/material.dart';
import 'package:doctor_app/pages/payer.dart';

class Patient extends StatefulWidget {
  Patient({Key? key}) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  String? valueChoose;
  String? valueGenre;
  String? valueAge;
  List<String> listItem = ['Self', 'Other'];
  List<String> genre = ['Male', 'Female'];
  List<String> age = ['24 years', '23 years', '22 years', '21 years', '20 years'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              child: Text('Booking for'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  child: DropdownButton<String>(
                    hint: Text('Self'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    isExpanded: true,
                     iconEnabledColor: Colors.blue,
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
                    underline: Container(),
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
                border: Border.all(width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  child: DropdownButton<String>(
                    hint: Text('Male'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    isExpanded: true,
                     iconEnabledColor: Colors.blue,
                    value: valueGenre,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueGenre = newValue;
                      });
                    },
                    items: genre.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    underline: Container(),
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
                border: Border.all(width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  child: DropdownButton<String>(
                    
                    hint: Text('24 years'),
                    dropdownColor: Colors.blue[100],
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    isExpanded: true,
                     iconEnabledColor: Colors.blue,
                    value: valueAge,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueAge = newValue;
                      });
                    },
                    items: age.map((String valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    underline: Container(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Write your problem'),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),

              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Color.fromRGBO(243, 237, 237, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Payer()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
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
