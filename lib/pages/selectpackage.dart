import 'package:flutter/material.dart';

class SelectPackage extends StatelessWidget {
   SelectPackage({super.key});
  final categories = [
   {
    'icon': Icons.message,
    'color': const Color.fromARGB(239, 210, 68, 8),
    'title': 'Arcade',
   },
      {
    'icon': Icons.call,
    'color': const Color.fromARGB(255, 201, 12, 12),
    'title': 'Tab Title',
   },
      {
    'icon': Icons.video_call,
    'color': const Color.fromARGB(255, 13, 199, 16),
    'title': 'Color Title',
    
   },
      {
    'icon': Icons.person,
    'color': const Color.fromARGB(255, 16, 88, 224),
    'title': 'My Home',
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