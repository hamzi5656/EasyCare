import 'package:auth/User/Product/productDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class dltprod extends StatefulWidget {
  Map productinf;
  dltprod({super.key,required this.productinf });
 
  @override
  State<dltprod> createState() => _dltprodState();
}

class _dltprodState extends State<dltprod> {
     void initState() {
   
      print("step 1 ______________");

      deleteProd();
     
      }
      
      deleteProd(){

      FirebaseFirestore.instance.collection("Product").doc("id").delete().then((response) {
     
      setState(() {

        print("+++++++++++++++++++++++++++++++++++");
       
       });
    
      print("_________________________________________");

      });
      }
      


  @override
  Widget build(BuildContext context) {
       Timestamp durationTimestamp = widget.productinf['duration'];
    DateTime durationDateTime = durationTimestamp.toDate();

    // Extracting hours from DateTime object
    int hours = durationDateTime.hour;
    return Container(margin: EdgeInsets.only(top: 10,left: 2,right: 2,bottom: 10),
     
     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey.withOpacity(.2))),
     height: 300,width: 170,
    child: Padding(
       padding: const EdgeInsets.all(10.0),
       child: Column(mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
         children: [ 
          
       Image(height: 120,width: 120,
         image: NetworkImage(
    
        "${widget.productinf["img"]}")),
       SizedBox(height: 10,),
       Text("${widget.productinf["name"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
       Text(
                           "Duration: $hours hours",
                           style: TextStyle(fontSize: 16),
                         ),
       Text("${widget.productinf["description"]}",maxLines: 1,),
       Text( "${widget.productinf["price"]}".toString(),style: TextStyle(fontWeight: FontWeight.bold),),
      IconButton(onPressed: (){
       deleteProd;
      }, icon: Icon(Icons.delete))
           ],),
     ),);
  }
}