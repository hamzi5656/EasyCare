import 'package:auth/User/Product/produxtBooking.dart';
import 'package:flutter/material.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Cart",
      style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),
      
      body: Column(children: [],),
      bottomSheet: Container(height: 70,width: double.infinity,
         color:Colors.deepPurple,child: Center(child: InkWell(onTap: ()
         {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductBooking()));
         },
          child: Text("Check out",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),),);
  }
}