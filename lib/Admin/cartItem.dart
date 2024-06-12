import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  String itemId;
   CartItem({super.key,required this.itemId});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  Map itemData={};
  bool isLoading=true;
    @override
  void initState() {
   
    getItem();
  }



   getItem() async {
  await  FirebaseFirestore.instance
        .collection("Product")
        .doc(widget.itemId)
        .get()
        .then((response) {
      if (response.exists) {
        setState(() {
        itemData = response.data()!;
        isLoading = false;
      });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   return isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              // Text(itemData['name']),
              Card(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: NetworkImage(itemData['img'],),height: 300,
                    ),
                    SizedBox(height: 30,),
                    Text(itemData['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("For "+ itemData['category'] +"  Person"),
                    SizedBox(height: 10,),
                    Text(itemData['price'].toString()),
                 
                   
                    ],),
              ),)
             
            ],
          );
  }
}