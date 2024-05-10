import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Mobility extends StatefulWidget {
  const Mobility({super.key});

  @override
  State<Mobility> createState() => _MobilityState();
}

class _MobilityState extends State<Mobility> {
  List<Map> allMobility=[];
  @override

   void initState() {
      // TODO: implement initState
      super.initState();

      getMobilityProducts();
      }
   getMobilityProducts(){

      FirebaseFirestore.instance.collection("Product").where("category", isEqualTo: "Mobility").get().then((response) {
      List<Map<String,dynamic>> temp=[];
      for (var element in response.docs) {
      temp.add({...element.data(), "id":element.id });
      }
      allMobility = temp; 
      setState(() { });
      print(allMobility);
      print("=====================");

      });
      }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobility Devices",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,),
        
        
);
  }
}