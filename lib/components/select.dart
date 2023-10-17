import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyDropDownButton(),
  ));
}

class MyDropDownButton extends StatefulWidget {
  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? selectedValue;
  List<String> options = ['filter','Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Button Example'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}

//  {'heure': "7:00 PM"},
//     {'heure': "7:30 PM"},
//     {'heure': "8:00 PM"},
//     {'heure': "8:30 PM"},
//     {'heure': "9:00 PM"},
//     {'heure': "9:30 PM"},
//     {'heure': "10:00 PM"},