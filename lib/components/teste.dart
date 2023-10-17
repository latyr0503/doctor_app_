import 'package:doctor_app/components/widgetLis.dart';
import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  List<Map<String, dynamic>> items = [
    {
      "title": "Title 1",
      "subTitle": "Subtitle 1",
      "listTitleColor": Colors.amber,
      "trailingIcon": Icons.access_time_filled,
      "iconColors": Colors.blue,
      "leadingIcon": Icons.zoom_in_map_sharp,
    },
    {
      "title": "Title 2",
      "subTitle": "Subtitle 2",
      "listTitleColor": Colors.white, // Valeur par défaut pour "listTitleColor"
      "trailingIcon": Icons.error, // Valeur par défaut pour "trailingIcon"
      "iconColors": const Color.fromRGBO(198, 19, 19, 1), // Valeur par défaut pour "iconColors"
      "leadingIcon": Icons.error, // Valeur par défaut pour "leadingIcon"
    },
    {
      "title": "Title 3",
      "subTitle": "Subtitle 3",
      "listTitleColor": Colors.white,
      "trailingIcon": Icons.error,
      "iconColors": const Color.fromRGBO(10, 157, 183, 1),
      "leadingIcon": Icons.error,
    },
    {
      "title": "Title 4",
      "subTitle": "Subtitle 4",
      "listTitleColor": Colors.white,
      "trailingIcon": Icons.error,
      "iconColors": Colors.black,
      "leadingIcon": Icons.error,
    },
    {
      "title": "Title 5",
      "subTitle": "Subtitle 5",
      "listTitleColor": Colors.white,
      "trailingIcon": Icons.error,
      "iconColors": Colors.black,
      "leadingIcon": Icons.error,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var itemWidgets = items.map((item) {
      return NewWidgetList(
        title: item["title"]!,
        subTitle: item["subTitle"]!,
        listTitleColor: item["listTitleColor"],
        trailingIcon: item["trailingIcon"],
        iconColors: item["iconColors"],
        leadingIcon: item["leadingIcon"],
      );
    }).toList();

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
        children: [
          // NewWidgetList(
          //   title: "sene",
          //   subTitle: "645325",
          //   listTitleColor: Colors.amber,
          //   trailingIcon: Icons.access_time_filled,
          //   iconColors: Colors.blue,
          //   leadingIcon: Icons.zoom_in_map_sharp,
          // ),
          Column(
            children: itemWidgets,
          )
        ],
      ),
    );
  }
}
