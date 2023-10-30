import 'package:doctor_app/components/widgetLis.dart';
import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text(
          "Personnalisation des éléments",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const  [
          NewWidgetList(
            title: "sene",
            subTitle: "645325",
            listTitleColor: Colors.amber,
            trailingIcon: Icons.access_time_filled,
            iconColors: Colors.blue,
            leadingIcon: Icons.zoom_in_map_sharp,
            
          ),
          
        ],
      ),
    );
  }
}
