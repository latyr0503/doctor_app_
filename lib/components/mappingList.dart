import 'package:flutter/material.dart';

class MappingList extends StatelessWidget {
   MappingList({super.key});
  final categories = [
   {
    'icon': Icons.track_changes_outlined,
    'color': const Color.fromARGB(239, 210, 68, 8),
    'title': 'Arcade',
    'images': const AssetImage('assets/apple.png')
   },
      {
    'icon': Icons.tab_rounded,
    'color': const Color.fromARGB(255, 201, 12, 12),
    'title': 'Tab Title',
    'images': const AssetImage('assets/salle.jpg')
   },
      {
    'icon': Icons.color_lens_outlined,
    'color': const Color.fromARGB(255, 13, 199, 16),
    'title': 'Color Title',
     'images': const AssetImage('assets/docteur.jpg')
   },
      {
    'icon': Icons.home_max,
    'color': const Color.fromARGB(255, 16, 88, 224),
    'title': 'My Home',
     'images': const AssetImage('assetsfacebook.png')
   },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Color(0xFFF6F0FF),
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(20),
          topRight:  Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
              height: 140,
              color: Colors.blue,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) =>  Column(
                  children: [
                   Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (categories[index]['color'] as Color)
                      ),
                      child: Icon(categories[index]['icon'] as IconData)
                   ),
//                   Container(
//                     child: Image(image: categories[index]['images'],
//    )),
                
                  ],
                )), 
                separatorBuilder: ((context, index) => const SizedBox(width: 33,)),
                itemCount: categories.length
               ),
          ),
        ],
      ),
      );

  }
}