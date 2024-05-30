
import 'package:auth/User/Product/commetns.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  List userDetails = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initjkhjkhkj sthhate");
  
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("LLLLLLLLLLLLLLLLL");
  }
  
    getUserData() {
    FirebaseFirestore.instance
        .collection("UserDetail")
        .doc() 
        .get()
        .then((res) {
     print(userDetails);

    });
  
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    SafeArea(child: Column(children: [
   Center(child: 
   
  TextButton(onPressed: (){

    Navigator.push(context, MaterialPageRoute(builder: (context)=> TestMe()));
  }, child: Text("Enter "))
   
   ),
      
      
      ],

      )),);
  }
}
