import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String? valueChoose;
  List<String> listItem = ['item1', 'item2', 'item3', 'item4', 'item5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: valueChoose,
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue;
            });
          },
          items: listItem.map((valueItem) {
            return DropdownMenuItem<String>(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }
}
