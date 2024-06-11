import 'package:auth/Admin/cartItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  Map ordersData;
  Preview({super.key, required this.ordersData});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  List  itemsList =[];

  @override
  void initState() {
    // print();
    setState(() {
      itemsList=widget.ordersData["items"];
    });
    // FirebaseFirestore.instance
    //     .collection("Trans")
    //     .where("approved", isEqualTo: false)
    //     .get()
    //     .then((response) {
    //   setState(() {});
    //   print("datattaa");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ...itemsList.map((e)=>
          CartItem(itemId: e)
        
          )
        ],
      ),
    );
  }
}
