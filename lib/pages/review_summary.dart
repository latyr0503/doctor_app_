import 'package:doctor_app/components/doctor.dart';
import 'package:doctor_app/pages/validation.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  Summary({Key? key});

  List<Map<String, dynamic>> summary1 = [
    {
      'info': 'Date & heure',
      'resul': '24 Aug 2023 | 10:00 AM',
    },
    {
      'info': 'Package',
      'resul': 'Messaging',
    },
    {
      'info': 'Duration',
      'resul': '30 minutes',
    },
    {
      'info': 'Booking for',
      'resul': 'Self',
    },
  ];

  List<Map<String, dynamic>> summary2 = [
    {
      'infodeux': 'Amount',
      'resuldeux': '2000cfa',
    },
    {
      'infodeux': 'Duration(30mins)',
      'resuldeux': '1 X 2000cfa',
    },
    {
      'infodeux': 'Duration',
      'resuldeux': '30 minutes',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review Summary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Details(),
          const SizedBox(height: 20,),
          const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 25,
              endIndent: 25,
              height: 0,
            ),
          const SizedBox(
            height: 10,
          ),
          // Utilisez un Container au lieu de Card
          ...summary1.map((item) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['info'], style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                  Text(item['resul'], style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            );
          }),
          const SizedBox(height: 10,),
          const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 25,
              endIndent: 25,
              height: 0,
            ),
          const SizedBox(height: 10,),  
          ...summary2.map((item) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['infodeux'],style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                  Text(item['resuldeux'], style: const TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
            );
          }),
          const SizedBox(height: 20,),
         Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
          child: const Row(
            children: [
              Text('Total',style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
              Spacer(),
              Text('2000cfa', style: TextStyle(fontWeight: FontWeight.w600),),
            ],
          ),
         ),
         const SizedBox(height: 10,),
          const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 25,
              endIndent: 25,
              height: 0,
            ),   
            
            Container(
          margin: const EdgeInsets.all(8.0),
          padding:const  EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5),
          child: Row(
            children: [
              const Icon(Icons.vignette, color: Colors.blue,),
              const SizedBox(width: 5,),
              const Text('Cash',style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
              const Spacer(),
              TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const validation()),
                      );
                    },
                    child: const Text('Change'),
               )
            ],
          ),
         ),
            const SizedBox(
              height: 50,
            ),
             Container(
              padding: const  EdgeInsets.only(top: 10, left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  validation()),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Play Now",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],

      ),
    );
  }
}
