import 'package:flutter/material.dart';

class SliderBouton extends StatelessWidget {
  const SliderBouton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
      // ignore: avoid_unnecessary_containers
      Expanded(child: Container(
         child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Réservation",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
      )),

      Expanded(child: ElevatedButton(
             onPressed: () {},
             child: const Text(
               "verified",
               style: TextStyle(
                 fontWeight: FontWeight.normal,
                 color: Colors.white,
               ),
             ),
           )),

      Expanded(child: ElevatedButton(
             onPressed: () {},
             child: const Text(
               "lastest",
               style: TextStyle(
                 fontWeight: FontWeight.normal,
                 color: Colors.white,
               ),
             ),
           )),

      Expanded(child: ElevatedButton(
             onPressed: () {},
             child: const Text(
               "with photos",
               style: TextStyle(
                 fontWeight: FontWeight.normal,
                 color: Colors.white,
               ),
             ),
           )),

      Expanded(child: ElevatedButton(
             onPressed: () {},
             child: const Text(
               "details",
               style: TextStyle(
                 fontWeight: FontWeight.normal,
                 color: Colors.white,
               ),
             ),
           )),

      Expanded(child: ElevatedButton(
             onPressed: () {},
             child: const Text(
               "patients",
               style: TextStyle(
                 fontWeight: FontWeight.normal,
                 color: Colors.white,
               ),
             ),
           )),
      ],
    );
  }
}