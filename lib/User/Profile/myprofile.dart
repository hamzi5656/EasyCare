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
    return Scaffold(appBar: AppBar(title: Text("Edit Profile",style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),);
  }
}