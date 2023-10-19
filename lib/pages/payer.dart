import 'package:flutter/material.dart';

class Payer extends StatefulWidget {
  const Payer({super.key});

  @override
  State<Payer> createState() => _PayerState();
}

class _PayerState extends State<Payer> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Methodes de Payements',
        style:  TextStyle(fontWeight: FontWeight.bold),),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          // Input de visa
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.topLeft,
              child: const Text(
                'Credit & Debit Card',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      border: _type == 1
                          ? Border.all(width: 1, color: Colors.blue)
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent),
                  child: Center(
                    // le bouton Radio au niveau du champ de la carte Visa
                    child: Row(
                      children: [
                       const Icon(
                          Icons.fact_check_sharp,
                          color: Colors.blue,
                          size: 50,
                        ),
                       const SizedBox(width: 5,),
                        Text('Add New Card',
                            style: _type == 1
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                                    Spacer(),
                        Radio(
                          value: 1,
                          groupValue: _type,
                          onChanged: _handleRadio,
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),

               const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.topLeft,
              child: const Text(
                'More Payement Options',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                Container(
                  
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      border: _type == 2
                          ? Border.all(width: 1, color: Colors.blue)
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent),
                  child: Center(
                    // le bouton Radio au niveau du champ de la carte Visa
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 40,
                          width: 40,
                          child:Image(image: AssetImage('assets/paypal.png')),
                        ),
                        SizedBox(width: 5,),
                        
                        Text('Paypal',
                            style: _type == 1
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                                    Spacer(),
                        Radio(
                          value: 2,
                          groupValue: _type,
                          onChanged: _handleRadio,
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      border: _type == 3
                          ? Border.all(width: 1, color: Colors.blue)
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent),
                  child: Center(
                    // le bouton Radio au niveau du champ de la carte Visa
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child:Image(image: AssetImage('assets/apple.png')),
                        ),
                        SizedBox(width: 5,),
                        Text('Add New Card',
                            style: _type == 1
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                                    Spacer(),
                        Radio(
                          value: 3,
                          groupValue: _type,
                          onChanged: _handleRadio,
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            //  Input de paypal
            

          ),
        ),
      ),
    );
  }
}
