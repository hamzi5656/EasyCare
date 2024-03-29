import 'package:flutter/material.dart';
class Medical extends StatelessWidget {
  const Medical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Medical Devices",style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),);
  }
}