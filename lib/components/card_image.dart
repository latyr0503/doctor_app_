import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? subTitleBis;
  final ImageProvider imageCard;
  final double width;

  const CardImage({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.subTitleBis,
    required this.width, 
    this.imageCard = const AssetImage("assets/doc2.jpg"),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: width,
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    image: imageCard,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                  )),
            ),
            ListTile(
              title: Text(
                title.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Row(
                children: [
                  const Icon(
                    Icons.access_time_filled_rounded,
                    color: Color.fromRGBO(13, 71, 161, 1),
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text.rich(
                    TextSpan(
                      text: subTitle.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: ' - ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(21, 101, 192, 1),
                          ),
                        ),
                        TextSpan(
                          text: subTitleBis.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
