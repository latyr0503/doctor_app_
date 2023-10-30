import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyDropDownButton(),
  ));
}

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? selectedValue;
  List<String> options = ['filter','Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Button Example'),
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

