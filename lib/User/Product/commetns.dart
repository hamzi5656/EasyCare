import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  

   List<Map> prodReview=[];
      @override
      void initState() {
    
      print("+++++++++++++++");

      getReview();
     
      }
      
      getReview(){

      FirebaseFirestore.instance.collection("Review").get().then((response) {
      List<Map<String,dynamic>> temp=[];
      for (var element in response.docs) {
      temp.add({...element.data(), "id":element.id });
      }
      prodReview = temp; 
      setState(() { });
      print(prodReview);
      print("=====================");

      });
     
      }


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Colors.pink,
      ),
      body: Column(children: [
        Center(child: 
        Text("")
        )
        
        ],)
    );
  }
}