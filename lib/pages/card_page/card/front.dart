import 'package:flutter/material.dart';

class CreditCardFront extends StatefulWidget {
  final String cardNo;
  final String exp;

  const CreditCardFront({
    Key? key,
    required this.cardNo,
    required this.exp,
  }) : super(key: key);

  @override
  State<CreditCardFront> createState() => _CreditCardFrontState();
}

class _CreditCardFrontState extends State<CreditCardFront> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 370,
      padding: const EdgeInsets.all(30),
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
          const Row(
            children: [
              Text('Carte Bancaire',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                image: AssetImage('assets/chip.png'),
                height: 27,
              ),
              Transform.rotate(
                angle: 90 * 3.141592 / 180,
                child: const Icon(
                  Icons.wifi,
                  size: 40,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 13),
          Text(
            widget.cardNo.isEmpty ? 'XXXX XXXX XXXX XXXX' : widget.cardNo,
            style: TextStyle(
                color: widget.cardNo.isEmpty
                    ? Colors.white.withOpacity(0.3)
                    : Colors.white,
                fontSize: 20,
                letterSpacing: 1),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.exp.isEmpty ? 'XX/XX' : widget.exp,
                style: TextStyle(
                    color: widget.exp.isEmpty
                        ? Colors.white.withOpacity(0.3)
                        : Colors.white,
                    fontSize: 19),
              ),
              const Image(
                image: AssetImage('assets/logocard.jpg'),
                height: 25,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
