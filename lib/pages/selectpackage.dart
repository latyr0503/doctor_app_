import 'package:flutter/material.dart';

class SelectPackage extends StatelessWidget {
   SelectPackage({super.key});
  final categories = [
   {
    'icon': Icons.message,
    'color': const Color.fromRGBO(187, 222, 251, 1),
    'title': 'Messaging',
   },
      {
    'icon': Icons.call,
    'color': const Color.fromRGBO(187, 222, 251, 1),
    'title': 'Voice Call',
   },
      {
    'icon': Icons.video_call,
    'color': const Color.fromRGBO(187, 222, 251, 1),
    'title': 'Video Call',
    
   },
      {
    'icon': Icons.person,
    'color': const Color.fromRGBO(187, 222, 251, 1),
    'title': 'In Person',
   },
  ];

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
            title: const Center(
              child: Text(
                'Select Package',
              ),
            )),
    
   body: Container(
      height: 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(20),
          topRight:  Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
              height: 140,
             
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
                      child: Icon(categories[index]['icon'] as IconData, color: Colors.blue,)
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
      )
       );

  }
}