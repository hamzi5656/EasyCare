import 'package:cloud_firestore/cloud_firestore.dart';
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
        ? CircularProgressIndicator()
        : Column(
            children: [
              Text(itemData['name']),
             
            ],
          );
  }
}