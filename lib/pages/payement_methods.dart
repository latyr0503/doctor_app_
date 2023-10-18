import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  // Les données des méthodes de paiement
  List<Map<String, dynamic>> categories = [
    {
      'image': AssetImage('assets/paypal.png'), // Chemin de l'image PayPal
      'title': 'Paypal',
    },
    {
      'image': AssetImage('assets/apple.png'), // Chemin de l'image Apple Pay
      'title': 'Apple Pay',
    }
  ];

  @override
  Widget build(BuildContext context) {
    // La page de méthodes de paiement
    return Scaffold(
      appBar: AppBar(

          leading: Builder(
                builder: (context) => Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                    )),
        title: Center(
          child: Text('Methodes de payements', style: TextStyle( fontSize: 18, fontWeight: FontWeight.w800),),
        ),
      ),
      body: Column(
        children: [

          Container(
            margin: EdgeInsets.only(left: 10, top: 30, bottom: 10),
            child: const Text(
              'Credit & Debit Card',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),


          Container(
              padding: EdgeInsets.only(left:30, right:30),
            
            child: const Card(
              child: Row(

                children: [
             SizedBox(width: 10,),
             Icon(Icons.fact_check_sharp, color: Colors.blue, size: 30,),
             SizedBox(width: 10,),
             Text('Add New Card'),
             Spacer(),
             Icon(Icons.arrow_forward),
             SizedBox(width: 20,)
                ],
              ),
            ),
          ),
          // Titre de la section "Méthodes de paiement"
          Container(
            padding: const EdgeInsets.only(left:30, right:30),
            margin: EdgeInsets.only(left: 10, top: 20),
            child: const Text(
              'More Payment Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Liste des méthodes de paiement
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:30, right:30),
              child: ListView(
                children: categories.map((item) {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: item['icon'] != null
                          ? CircleAvatar(
                              child: Icon(
                                item['icon'],
                                color: Colors.blueAccent,
                              ),
                            )
                          : Image(
                              image: item['image'], // Afficher l'image de la méthode de paiement
                            ),
                      title: Text(item['title']), // Afficher le titre de la méthode de paiement
                      trailing: Icon(Icons.arrow_forward), // Icône pour indiquer que l'utilisateur peut cliquer pour en savoir plus
                      onTap: () {
                        // Ajoutez ici la logique pour gérer le clic sur une méthode de paiement
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
