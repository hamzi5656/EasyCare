import 'package:auth/Admin/preview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Userorderdata extends StatefulWidget {
  Map userdata;
  Userorderdata({super.key, required this.userdata});

  @override
  State<Userorderdata> createState() => _UserorderdataState();
}

class _UserorderdataState extends State<Userorderdata> {
  Map<String, dynamic> user = {};
  bool isLoading = true;

  @override
  void initState() {
    print("object");
    print(widget.userdata['uid']);
    getuserdata();
  }

   getuserdata() async {
  await  FirebaseFirestore.instance
        .collection("UserDetail")
        .doc(widget.userdata['uid'])
        .get()
        .then((response) {
      if (response.exists) {
        setState(() {
        user = response.data()!;
        isLoading = false;
      });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Column(
            children: [
              Text(user['Name']),
              ElevatedButton(onPressed: (){
                // print(widget.userdata);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Preview(ordersData: widget.userdata,)));
              }, child: Text("View"))
            ],
          );
  }
}
