import 'package:auth/Admin/otherproducts.dart';
import 'package:auth/Admin/userpopular.dart';
import 'package:flutter/material.dart';
class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Dashboard"),),
    body: SafeArea(child: Column(children: [
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>userpopular() ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
          
            children: [
              Icon(Icons.insert_emoticon_outlined),
              SizedBox(width: 20,),
          Text("Popular Products")
               
          ],),
        ),
      ),
   SizedBox(height: 20,),
   InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>otherProducts() ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
          
            children: [
              Icon(Icons.punch_clock_rounded),
              SizedBox(width: 20,),
          Text("Other Products")
               
          ],),
        ),
      )

     
      
      
      ],)));
  }
}