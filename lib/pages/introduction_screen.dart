import 'package:doctor_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Premier page",
      body: """Lorem ipsum dolor sit amet consectetur adipiscing elit, 
      torquent montes rutrum fermentum quam.""",
      image: Center(
        child: Image.asset("assets/Medical prescription-pana.png"),
      ),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          bodyTextStyle: TextStyle(fontSize: 15.0)),
    ),
    PageViewModel(
      title: "Deuxieme page",
      body: """Lorem ipsum dolor sit amet consectetur adipiscing elit, 
      torquent montes rutrum fermentum quam.""",
      image: Center(
        child: Image.asset("assets/Date picker-pana.png"),
      ),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          bodyTextStyle: TextStyle(fontSize: 15.0)),
    ),
    PageViewModel(
      title: "troisième page",
      body: """Lorem ipsum dolor sit amet consectetur adipiscing elit, 
      torquent montes rutrum fermentum quam.""",
      // footer: ElevatedButton(
      //   onPressed: () {},
      //   child: const Text("Let's Go"),
      // ),
      image: Center(
        child: Image.asset("assets/Doctors-pana.png"),
      ),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          bodyTextStyle: TextStyle(fontSize: 15.0)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => onDone(context),
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
              size: Size(15, 15),
              color: Color.fromRGBO(66, 165, 245, 1),
              activeColor: Color.fromRGBO(21, 101, 192, 1),
              activeSize: Size.square(20)),
          showDoneButton: true,
          done: const Text(
            "Done",
            style: TextStyle(fontSize: 20),
          ),
          // showSkipButton: true,
          // skip: const Text(
          //   "Skip",
          //   style: TextStyle(fontSize: 20),
          // ),
          showBackButton: true,
          back: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceInOut,
        ),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Welcome_page(),
      ),
    );
  }
}
