import 'package:doctor_app/pages/patients.dart';
import 'package:doctor_app/widgets/package.dart';
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
  List<String> listItem = ['30minute', '1h00', '1h30', '2h00'];

  int _value = 0;

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Duration', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
          Container(
  decoration: BoxDecoration(
    border: Border.all(width: 1.0, color: Color.fromRGBO(243, 237, 237, 1)), // Ajoutez une bordure
    borderRadius: BorderRadius.circular(10), // Facultatif : pour des coins arrondis
  ),

  child: Padding(
   padding: const EdgeInsets.symmetric(horizontal: 10),
   child: Container(
      
      padding: const EdgeInsets.symmetric(),
      width: double.infinity,
      child: DropdownButton<String>(
      hint: Text('30minute'),
      dropdownColor: Colors.blue[100],
      icon: const Icon(Icons.arrow_drop_down,),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),
      iconSize: 36,
      iconEnabledColor: Colors.blue,
      isExpanded: true,
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
     underline: Container(),
    ),
   ),
  ),
),
SizedBox(height: 20,),
 Container(
   child: Text('Select Package', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
 ),

  Card(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),

      child: Row(
              children: [
                const Package(
              title: "Messaging",
              subTitle: "Avec le docteur",
              money: "2000cfa",
              min: "/30min",
              listTitleColor: Colors.blue,
              iconColors: Color.fromRGBO(187, 222, 251, 1), // J'ai corrigé le nom de la propriété 'iconColor'.
              leadingIcon: Icons.message,
            ),
            Spacer(),
            Radio<int>(
              value: 2,
              groupValue: _value,
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    _value = value;
                  });
                }
              },
            ),
              ],
            ),
    ),
  ),
  

  Card(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),

      child: Row(
              children: [
                const Package(
              title: "Appel Vocal",
              subTitle: "Avec le docteur",
              money: "4000cfa",
              min: "/30min",
               listTitleColor: Colors.blue,
              iconColors: Color.fromRGBO(187, 222, 251, 1), // J'ai corrigé le nom de la propriété 'iconColor'.
              leadingIcon: Icons.call,
            ),
            Spacer(),
            Radio<int>(
              value: 3,
              groupValue: _value,
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    _value = value;
                  });
                }
              },
            ),
              ],
            ),
    ),
  ),
  

  Card(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
            children: [
              const Package(
            title: "Appel Vidéo",
            subTitle: "Avec le docteur",
            money: "6000cfa",
            min: "/30min",
             listTitleColor: Colors.blue,
            iconColors: Color.fromRGBO(187, 222, 251, 1),
            leadingIcon: Icons.video_camera_front,
          ),
          Spacer(),
          Radio<int>(
            value: 4,
            groupValue: _value,
            onChanged: (int? value) {
              if (value != null) {
                setState(() {
                  _value = value;
                });
              }
            },
          ),
            ],
          ),
    ),
  ),
  
    Card(
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),

        child: Row(
              children: [
                const Package(
              title: "En personne",
              subTitle: "Avec le docteur",
              money: "8000cfa",
              min: "/30min",
               listTitleColor: Colors.blue,
              iconColors: Color.fromRGBO(187, 222, 251, 1), 
              leadingIcon: Icons.person,
            ),
            Spacer(),
            Radio<int>(
              value: 1,
              groupValue: _value,
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    _value = value;
                  });
                }
              },
            ),
              ],
            ),
      ),
    ),
  
 SizedBox(height: 50,),
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
