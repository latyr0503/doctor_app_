import 'package:flutter/material.dart';

class CardCalendar  extends StatelessWidget {
  const CardCalendar ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue.shade600,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/plan-moyen-medecin-specialiste-bras-dans-poches-regardant-camera.jpg"),
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr Alana Ruete",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Dentist consultation",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(
                  Icons.phone_rounded,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue.shade800,
                ),
                width: 300.0,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.calendar_month,
                            size: 25, color: Colors.white),
                        Text(
                          "Monday, 26 July",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Icon(Icons.alarm, size: 25, color: Colors.white),
                        Text(
                          "09:00 - 10:00",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
