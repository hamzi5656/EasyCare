import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Map<String, dynamic> userDetails = {};
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    print("abcbcb");
  }

  getUserData() async {
    String userid = await FirebaseAuth.instance.currentUser!.uid;
   await FirebaseFirestore.instance
        .collection("UserDetail")
        .doc(userid)
        .get()
        .then((res) {
      setState(() {
        userDetails = res.data()!;
        print("++++++++++");
      });
        print(userDetails);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("My Profile",
    style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
       
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("User Name:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Text("${userDetails["Name"]}",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18), ),
      
        ],),SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("Father Name:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Text("${userDetails["fathername"]}",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18), ),
      
        ],),SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("Email:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Text("${userDetails["email"]}",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16), ),
      
        ],)
        ,SizedBox(height: 20,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("Address:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      Text("${userDetails["Address"]}",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18), ),

      ],)
                        ],),
    ) ,);
    
  
  }
}