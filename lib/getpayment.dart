// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:io';

// class Payment extends StatefulWidget {
//   @override
//   _PaymentState createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//      final _auth= FirebaseAuth.instance;
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
//       Future<void> _uploadImage(String userId) async {
//   if (_image == null) return;

//   try {
//     // Upload to Firebase Storage
//     String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.png';
//     UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(_image!);
//     TaskSnapshot taskSnapshot = await uploadTask;
//     String downloadURL = await taskSnapshot.ref.getDownloadURL();

//     // Save URL and userId to Firestore
//     await FirebaseFirestore.instance.collection('images').add({
//       'url': downloadURL,
//       'uid': "ui"
//       // 'userId': userId, // Store user ID or any other identifier
//     });
    
//     // Clear the image after upload
//     setState(() {
//       _image = null;
//     });

//     // Show success message
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image uploaded successfully!')));
//   } catch (e) {
//     // Show error message
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to upload image: $e')));
//   }
// };
      
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
//         title: Text('Upload Image to admin'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.admin_panel_settings),
//             onPressed: () {
//               Navigator.pushNamed(context, '/admin');
//             },
//           ),
//         ],
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