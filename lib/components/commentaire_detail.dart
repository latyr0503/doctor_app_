import 'package:flutter/material.dart';

class CommentaireDetail extends StatelessWidget {
  const CommentaireDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 5, right: 10, bottom: 10),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/docteur.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 30, left: 30),
                  child: const Icon(
                    Icons.assignment_turned_in_rounded,
                    size: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10, left: 10),
                child: const Text('Dr John Wilson',
                    style: TextStyle(fontSize: 15.0)),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 30, bottom: 10),
                child: const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text("5.0"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Ajout d'un espace vertical
          Container(
            child: const Text(
              'Lorem ipsum dolor sit amet consectetur adipiscing, elit coin, consequat suscipit sodales iaculis elementum vulputate nisl tempus, etiam phasellus euismod morbi porta cras hac.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/salle.jpg'),
                ),
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/salle.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
