import 'package:flutter/material.dart';

class CreditCardBack extends StatefulWidget {
  final String cvv;
  const CreditCardBack({
    Key? key,
    required this.cvv,
  }) : super(key: key);

  @override
  State<CreditCardBack> createState() => _CreditCardBackState();
}

class _CreditCardBackState extends State<CreditCardBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 370,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(6, 35, 68, 1)),
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(6, 35, 68, 1),
          Colors.blue,
        ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Container(
            color: Colors.black,
            height: 50,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 170,
              color: Colors.white,
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.cvv.isEmpty ? 'XXX' : widget.cvv,
                    style: const TextStyle(fontSize: 23, letterSpacing: 2),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text('Lorem ipsum dolor sit amet consectetur.',
                style: TextStyle(
                    fontSize: 10, color: Colors.white.withOpacity(0.5))),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
