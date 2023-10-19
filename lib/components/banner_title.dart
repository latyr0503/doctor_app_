import 'package:flutter/material.dart';

class BannerTitle extends StatelessWidget {
  final String textTitle;

  const BannerTitle({
    Key? key,
    required this.textTitle,
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
          onPressed: () {},
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
