import 'package:auth/Authentication/userlogin.dart';
import 'package:auth/Home/HomeNavigator.dart';
import 'package:auth/Home/homeScreen.dart';
import 'package:auth/Home/slider.dart';
import 'package:auth/firebase_options.dart';
import 'package:auth/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  // await PersistentShoppingCart();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {

 return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      //HomeNavigator(),
    );
  }
}
