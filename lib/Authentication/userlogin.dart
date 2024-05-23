import 'package:auth/Admin/homescreen.dart';
import 'package:auth/Authentication/userSignup.dart';
import 'package:auth/User/Home/HomeNavigator.dart';
import 'package:auth/User/Home/HomeScreen.dart';
import 'package:auth/User/cart/CartScreen.dart';
import 'package:auth/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
     getUserType([String? uid]) {
    final docRef = FirebaseFirestore.instance.collection("UserDetail").doc(uid);
    docRef.get().then(
      (doc) {
        print("2");

        Map<String, dynamic> userType = doc.data()!;
        final type = userType["Type"];
        print(userType);
        NavigateUser(type);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
     NavigateUser(String title) {
    
    switch (title) {
      case "user":
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => HomeScreen())));
          break;
        }

      case "Admin":
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => 
             AdminHome())));
          break;
        }
    }
  } 
    loginHandler() async {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((res) {
                  getUserType(res.user!.uid);
                  print("sep 1");
        });
      } on FirebaseAuthException catch (e) {
        print(e.code);
      }
    }

  @override
  Widget build(BuildContext context) {


    

  // checkUser() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     String? _userType = await getString("Type");
  //     print(_userType);
  //     if (_userType != null) {
  //       NavigateUser(_userType);
  //     }
  //   }
  // }



    

    

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "poppins"),
                ),
              ),

              Text(
                "Login to continue",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins"),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 40,),
              Flexible(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  loginHandler();
                },
                child: Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple, // Background color
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
                    "Don't Have an account?",
                    style: TextStyle(),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      "Signup",
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
