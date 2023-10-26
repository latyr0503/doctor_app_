import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChoixDate extends StatefulWidget {
  const ChoixDate({Key? key}) : super(key: key);

  @override
  _ChoixDateState createState() => _ChoixDateState();
}

class _ChoixDateState extends State<ChoixDate> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _controller = TextEditingController();

  TimeOfDay? time = TimeOfDay.now();
  bool isTimeChosen = false; // Add a boolean variable to track if the time is chosen

  void envoyerDateEtHeure() async {
    // if (isTimeChosen) {
    //   // Check if the time is already chosen
    //   print('Rendez-vous prise avec success');

    //   return; // Exit the function if the time is already chosen
    // }else{
    //   print('cette heure est deja choisie\n Veillez choisir un autre');

    // }

    final String url = 'https://doctor-app-h45i.onrender.com/rendez_vous/create_rendez_vous/';

    final String heureFormattee = '${time!.hour.toString().padLeft(2, '0')}:${time!.minute.toString().padLeft(2, '0')}';

    final Map<String, String> data = {
      'name_medecin': _controller.text,
      'date': _dateController.text,
      'heure': heureFormattee,
    };

    final response = await http.post(Uri.parse(url), body: data);

    if (response.statusCode == 200) {
      print('Data sent successfully!');
    } else {
      print('Failed to send data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextField(
                    controller: _controller,
                   decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Name Medecin',
                      ),
                    ),
              const Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            Container(
                child: TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Color.fromRGBO(187, 222, 251, 1),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
             const Text(
                'Heure',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Stack(
                children: [
                 
                    Container(
                    margin: EdgeInsets.only(left: 50, top: 10),
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                    ),
                    child: Text(
                      '${time!.hour.toString().padLeft(2, '0')}:${time!.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: FloatingActionButton(
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time!,
                        );
                        if (newTime != null) {
                          setState(() {
                            time = newTime;
                            isTimeChosen = true; // Set the boolean variable to true when the time is chosen
                          });
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Icon(
                       Icons.access_time,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue[100],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    envoyerDateEtHeure();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Send Date and Time',
                    style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
