
import 'package:flutter/material.dart';
Widget AppbarScreen(){
  return
   AppBar(backgroundColor: Colors.purple,
    title: 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         "EasyCare",style: TextStyle(fontSize: 18,color: Colors.blue),
        ),
        SizedBox(
          height: 4,
        ),
        Text("Make Shopping Easy",style: TextStyle(fontSize: 16,color: Colors.blue),),
      ],
    ),
     actions: [   
      Padding(padding: EdgeInsets.all(10.0),child:  Badge(child: Icon(Icons.badge),),)
   
],
     );
     
}
 