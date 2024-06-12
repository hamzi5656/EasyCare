
import 'package:auth/Authentication/userlogin.dart';
import 'package:auth/example.dart';
import 'package:auth/firebase_options.dart';
import 'package:auth/getpayment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
Future<void> main() async {
await PersistentShoppingCart().init();
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

 return GetMaterialApp(
     debugShowCheckedModeBanner: false,
     builder: EasyLoading.init(),
      home: 
    // Example(),
    // Payment()
     Login(),

    );
  }
}
