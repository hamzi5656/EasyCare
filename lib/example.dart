// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:io';

// class Example extends StatefulWidget {
//   @override
//   _ExampleState createState() => _ExampleState();
// }

// class _ExampleState extends State<Example> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   Future<void> _uploadImage() async {
//     if (_image == null) return;

//     try {
//       // Upload to Firebase Storage
//       String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.png';
//       UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(_image!);
//       TaskSnapshot taskSnapshot = await uploadTask;
//       String downloadURL = await taskSnapshot.ref.getDownloadURL();

//       // Save URL to Firestore
//       await FirebaseFirestore.instance.collection('images').add({'url': downloadURL});
      
//       // Clear the image after upload
//       setState(() {
//         _image = null;
//       });

//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image uploaded successfully!')));
//     } catch (e) {
//       // Show error message
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to upload image: $e')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) { 
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image to Firebase'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    try {
      // Get the current user ID, with null safety check
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user logged in')));
        return;
      }
      String userId = user.uid;

      // Upload to Firebase Storage
      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.png';
      UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      // Save URL and userId to Firestore
      await FirebaseFirestore.instance.collection('images').add({
        'url': downloadURL,
        'userId': userId, // Store user ID
      });

      // Clear the image after upload
      setState(() {
        _image = null;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image uploaded successfully!')));
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to upload image: $e')));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image to Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}