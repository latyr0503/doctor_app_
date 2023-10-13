import 'package:flutter/material.dart';

class CardSpeciality extends StatelessWidget {
  final String title;
  final ImageProvider images;

  const CardSpeciality({
    Key? key,
    required this.title,
    this.images = const AssetImage("assets/tooth.png"),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(
          top: 20.0,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue.shade100,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image(
                      width: 50,
                      height: 50,
                      image: images,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
