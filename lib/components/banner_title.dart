import 'package:flutter/material.dart';

class BannerTitle extends StatelessWidget {
  final String textTitle;
  final Widget pros; // Modification ici pour accepter un Widget

  const BannerTitle({
    Key? key,
    required this.textTitle,
    required this.pros,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          textTitle,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pros), // Utilisation directe de la variable pros comme une classe Widget
            );
          },
          child: const Text(
            "Voir Plus",
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
