import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _pickedFile;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => Container(
            margin: const EdgeInsets.only(left: 20),
          ),
        ),
      ),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: const Text(
                    'Complètez votre profil',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const Text(
                    "Don't worry, only you can see your personal\n data. No one else will be able to see it",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          if (_pickedFile != null)
                            CircleAvatar(
                              radius: 80,
                              backgroundImage: FileImage(_pickedFile!),
                            )
                          else
                            const CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage('logocard.jpg'),
                            ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _pickImage,
                            child: const Text('Changer la photo de profil'),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 130, left: 130),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Container(
                            child: const Icon(
                              Icons.edit,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _pickImage();
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(width: 0.8),
                          ),
                          hintText: 'Nom Complet',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(width: 0.8),
                          ),
                          hintText: 'Entrer le Numéro de téléphone',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 25),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(width: 0.8),
                          ),
                          hintText: 'Select Genre',
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Compléter le Profil',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
