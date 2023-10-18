import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Card Holder Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16, // Taille de la police
                fontWeight: FontWeight.bold, // Style de la police (facultatif)
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0.7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 0.8),
              ),
              hintText: 'Esther Howar',
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Card Number',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16, // Taille de la police
                fontWeight: FontWeight.bold, // Style de la police (facultatif)
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0.7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 0.8),
              ),
              hintText: '3536 3332 8383 2309',
            ),
          ),
          const SizedBox(height: 32.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Card Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16, // Taille de la police
                          fontWeight: FontWeight
                              .bold, // Style de la police (facultatif)
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0.7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(width: 0.8),
                        ),
                        hintText: '02/30',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
             
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'CVV',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16, // Taille de la police
                          fontWeight: FontWeight
                              .bold, // Style de la police (facultatif)
                        ),
                      ),
                    ),
                     TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 0.8),
                    ),
                    hintText: '000',
                  ),
                ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Add Card",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
