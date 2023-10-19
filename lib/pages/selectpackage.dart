import 'package:doctor_app/pages/patients.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SelectPackage(),
  ));
}

class SelectPackage extends StatefulWidget {
  SelectPackage({Key? key}) : super(key: key);

  @override
  _SelectPackageState createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
 String? valueChoose;
  List<String> listItem = ['item1', 'item2', 'item3', 'item4', 'item5'];



  List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.message,
      'color': const Color.fromRGBO(187, 222, 251, 1),
      'title': 'Messaging',
      'sousTitle': 'Chat with Doctor',
      'money': "25 CFA",
      'min': '30 min',
    },
    {
      'icon': Icons.call,
      'color': const Color.fromRGBO(187, 222, 251, 1),
      'title': 'Voice Call',
      'sousTitle': 'Voice Call with Doctor',
      'money': "50 CFA",
      'min': '30 min',
    },
    {
      'icon': Icons.video_call,
      'color': const Color.fromRGBO(187, 222, 251, 1),
      'title': 'Video Call',
      'sousTitle': 'Video with Doctor',
      'money': "75 CFA",
      'min': '30 min',
    },
    {
      'icon': Icons.person,
      'color': const Color.fromRGBO(187, 222, 251, 1),
      'title': 'In Person',
      'sousTitle': 'In Person visit with Doctor',
      'money': "100 CFA",
      'min': '30 min',
    },
  ];

  String currentOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Packages',
        style:  TextStyle(fontWeight: FontWeight.bold),),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Duration', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
          Container(
  decoration: BoxDecoration(
    border: Border.all(width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)), // Ajoutez une bordure
    borderRadius: BorderRadius.circular(4.0), // Facultatif : pour des coins arrondis
  ),

  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
   child: Container(
      padding: const EdgeInsets.symmetric(),
      width: double.infinity,
      child: DropdownButton<String>(
      hint: Text('30min'),
      dropdownColor: Colors.blue[100],
      icon: Icon(Icons.arrow_drop_down,),
      style: TextStyle(
        color: Colors.black
      ),
      iconSize: 36,
      value: valueChoose,
      onChanged: (String? newValue) {
        setState(() {
          valueChoose = newValue!;
        });
      },
      items: listItem.map((String valueItem) {
        return DropdownMenuItem<String>(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    ),
   ),
  ),
)
,  
 Container(
   child: Text('Select Package', style: TextStyle(fontSize: 24)),
 ),

            Expanded(
              child: ListView(
                children: categories.map((item) {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: item['color'],
                        child: Icon(item['icon'], color: Colors.blueAccent),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item['title']),
                          Text("${item['money']}")
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item['sousTitle']),
                          Text("${item['min']}")
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.input),
                      ),
                      
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Patient()),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Réservation",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
