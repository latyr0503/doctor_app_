import 'dart:io' if (dart.library.html) 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _imagePath;
  Uint8List? _imageBytes; // Utilisez Uint8List pour les images sur Flutter web

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');

    if (imagePath != null) {
      if (kIsWeb) {
        // Pour Flutter web, chargez l'image en tant que Uint8List
        final bytes = await NetworkAssetBundle(Uri.parse(imagePath)).load('');
        setState(() {
          _imageBytes = bytes.buffer.asUint8List();
        });
      } else {
        setState(() {
          _imagePath = imagePath;
        });
      }
    }
  }

  Future<void> _saveProfileImage(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', imagePath);
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _saveProfileImage(pickedFile.path);
      _loadProfileImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: <Widget>[
          if (kIsWeb && _imageBytes != null)
            Image.memory(_imageBytes!) // Utilisez Image.memory pour Flutter web
          else if (_imagePath != null)
            Image.asset((_imagePath!))
          else
            Text('No image selected.'),
          ElevatedButton(
            onPressed: _getImage,
            child: Text('Pick an image from gallery'),
          ),
        ],
      ),
    );
  }
}
