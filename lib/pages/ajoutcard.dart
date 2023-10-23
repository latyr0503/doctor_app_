import 'package:doctor_app/pages/add_card.dart';
import 'package:flutter/material.dart';

class AjoutCard extends StatelessWidget {
  const AjoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
               appBar: AppBar(
        title: const Text('Add Card',
        style:  TextStyle(fontWeight: FontWeight.bold),),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
        
             Padding(padding: EdgeInsets.all(10.0),
             child:Container(
              child: 
                 Image.asset('assets/visa.png'),
                 )
             ),
          
          AddCard(),
        ],
      ),
    );
  }
}
