//login screen

import 'package:auth/Authentication/userlogin.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Signup extends StatelessWidget {
    Signup({super.key});
TextEditingController _emailController= TextEditingController();
TextEditingController _passwordController= TextEditingController();
TextEditingController _nameController= TextEditingController();
// ignore: non_constant_identifier_names
Signupmethod() async {
  try {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _emailController.text,
    password: _passwordController.text
  ).then((User){
  
    FirebaseFirestore.instance.collection("UserDetail").doc(User.user!.uid).set({
      "Name": _nameController.text,
      "email":_emailController,
    }).then((value) {
  
    });

  } );
 
 
} on FirebaseAuthException catch (e) {
 print(e.code);
}
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "poppins"),
                ),
              ),
              Center(
                child: Text(
                  "Register Here",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "poppins"),
                ),
              ),
            const  SizedBox(
                height: 80,
              ),
              Flexible(
                child: TextField(
                  controller:_emailController,
                  decoration: InputDecoration(
                    border:const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "Email",
                      hintStyle:  const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
           const   SizedBox(
                height: 20,
              ),
              Flexible(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        
                        borderSide:const  BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Full Name",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
            const   SizedBox(
                height: 20,
              ),
              Flexible(
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: const  OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
             const  SizedBox(
                height: 20,
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(   
                onPressed: (){
                  Signupmethod();
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Sign up"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Background color
                    onPrimary: Colors.white, // Text color
                    elevation: 5,
                    minimumSize: Size(
                        MediaQuery.sizeOf(context).width * .9,
                        MediaQuery.sizeOf(context).width *
                            .16) // Elevation (shadow)
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "Have an account?",
                    style: TextStyle(),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Login()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
