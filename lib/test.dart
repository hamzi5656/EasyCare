import 'package:auth/Admin/userorders.dart';
import 'package:flutter/material.dart';
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
     Container(height: 300,width: 600,
      child: TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> UserOrders()));
      }, child: Text("check Orders")),
     )
      ],),
      );
  }
}
