import 'package:flutter/material.dart';
class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
   Container(height: 60,
    margin: const EdgeInsets.only(top: 10,right: 25,left: 25),
   padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(color: Colors.grey.withOpacity(.1),borderRadius: BorderRadius.circular(10)),
   child: const Flexible(
    
     child: Row(children: [
     Flexible(child: TextField(decoration: InputDecoration(hintText: "Search Products",hintStyle: TextStyle(color: Colors.black), 
     enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,),
     focusedBorder: InputBorder.none
     ),),
     
     ),
      Icon(Icons.search_rounded),
     
      
      ],),
   ),);
  }
}