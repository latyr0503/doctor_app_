import 'package:doctor_app/pages/review_summary.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {


  bool isChecked = false;
  
  String value = '';

  void submit (String a)
  {
    setState(() {
      value: 'message envoye: $a';
    });
  }

  void affichage (String b)
  {
    setState(() {
      value: 'Bienvenue $b';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      // Le formulaire d'envoi par Carte VISA
      child: Form(
        child: Column(
          children: [
            // la partie carte visa on insere ici une carte
             Padding(padding: EdgeInsets.all(10.0),
             child:Stack(
                children: <Widget>[
                  Image.asset('assets/visa.png'),
                  Positioned(
                    top: 10, // Position en haut
                    left: 10, // Position à gauche
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 10, 185, 19), // Couleur du texte
                        fontSize: 20, // Taille de la police
                      ),
                    ),
                  ),
                ],
              ),
             ),
            
            //Le premier input de notre formulaire
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Card Holder Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Esther Howar',
              ),
              keyboardType: TextInputType.text,
              autocorrect: true,
              autofocus: true,
              onChanged: affichage,
              onSubmitted: submit,
            ),
            const SizedBox(height: 10.0),

            //Le deuxieme input de notre formulaire
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Card Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '3536 3332 8383 2309',
              ),
            ),
            const SizedBox(height: 10.0),

            //on inserer ici deux input cote à cote(row) qui sont en line
            Row(
              children: [
                // Le premier input Row
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Expiration Date',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: '02/30',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),

                // Le deuxieme input Row
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'CVV',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: '000',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Le Checkbox
           Container(
            alignment: Alignment.topLeft,
             child: Row(
              children: [
                Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      SizedBox(width: 3,),
                Text('Save Card', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),)      
              ],
             ),
           ),
                
            // Le bouton d'envoi pour envoi les infos    
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Summary()),
                      );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
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
                    fontSize: 20,
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
