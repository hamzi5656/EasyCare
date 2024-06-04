import 'package:auth/Authentication/auth.dart';
import 'package:auth/Authentication/userlogin.dart';
import 'package:flutter/material.dart';
class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _forgetpass= TextEditingController();
  final _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
              
            Text("Enter your email to forget password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            SizedBox(
              height: 60,
              child: TextField(
                controller: _forgetpass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                
                label: Text("Enter Email to forget password"),
                hintText: "Enter Email"),),
            ),
            SizedBox(height: 20,),
            
            ElevatedButton(onPressed: (){
          
          _auth.sendPasswordReset(_forgetpass.text);
            }, child: Text("Submitt"))
            ],),
        ),
      ), 
    );
  }
}