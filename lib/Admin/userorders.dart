import 'package:auth/Admin/userorderdata.dart';
import 'package:auth/User/Product/produxtBooking.dart';
import 'package:auth/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserOrders extends StatefulWidget {
  UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  List<dynamic> allorders = [];
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Trans")
        .where("approved", isEqualTo: false)
        .get()
        .then((response) {
      List temp = [];
      for (var doc in response.docs) {
        temp.add(doc.data());
        //  print(doc.data());
      }
      print("temp");

      print(temp);
      // setState(() {
      allorders = temp;
      // });
      setState(() {});
      print("kjlkj");

      print(allorders);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Orders"),
      ),
      body: Column(children: [
        ...allorders.map((data) =>

            Userorderdata(userdata: data))
      ]),
    );
  }
}
