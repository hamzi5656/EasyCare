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
    body: Column(children: [
IconButton(onPressed: (){

  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllProducts()));
}, icon: Icon(Icons.production_quantity_limits),),
SizedBox(height: 20,),
IconButton(onPressed: (){

  Navigator.push(context, MaterialPageRoute(builder: (context)=> otherProducts()));
}, icon: Icon(Icons.add),)
    ],),);
  }
}