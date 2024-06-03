import 'package:auth/Authentication/userlogin.dart';
import 'package:auth/User/Profile/about.dart';
import 'package:auth/User/Profile/myprofile.dart';
import 'package:auth/User/cart/CartScreen.dart';
import 'package:auth/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    Logouthandler() {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Login()),
      );
      print("Logout");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(title:const  Text("Profile",style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),
      body: Column(children: [
      const   SizedBox(height: 10,),
     Padding(
       padding: const EdgeInsets.only(),
       child: Container(height: 45,width: double.infinity,color: Colors.deepPurple.withOpacity(.1),
        child: const Align(alignment: Alignment.centerLeft,
          child: Padding( 
            padding:  EdgeInsets.only(left: 10),
            child: Text("Profile",style: TextStyle(fontWeight:FontWeight.bold,
            color: Colors.deepPurple,
            ),),
          ),
        ),),
      
     ),
     const   SizedBox(height: 10,),
     InkWell(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const EditProfile() ));
     },
      child: ProfileRow(myicon: Icons.person, profileText: "My Profile")),
 
   const   SizedBox(height: 10,),
   
     Padding(
       padding: const EdgeInsets.only(),
       child: Container(height: 45,width: double.infinity,color: Colors.deepPurple.withOpacity(.1),
        child: const Align(alignment: Alignment.centerLeft,
          child: Padding( 
            padding:  EdgeInsets.only(left: 10),
            child: Text("GENERAL",style: TextStyle(fontWeight:FontWeight.bold,
            color: Colors.deepPurple,
            ),),
          ),
        ),),
      
     ),
   
     InkWell( 
      onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const Test () ));
      
      },
      child: ProfileRow(myicon: Icons.favorite_outline, profileText: "Favourite Product")),
     //ProfileRow(myicon: Icons.favorite_outline, profileText: "Favourite Services"),
     InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const  CartScreen()));
     },
      child: ProfileRow(myicon: Icons.shopping_bag_outlined, profileText: "My Cart")),
      const SizedBox(height: 10,),
     Padding(
       padding: const EdgeInsets.only(),
       child: Container(height: 45,width: double.infinity,color: Colors.deepPurple.withOpacity(.1),
        child:const Align(alignment: Alignment.centerLeft,
          child: Padding(
            padding:  EdgeInsets.only(left: 10),
            child: Text("About App",style: TextStyle(fontWeight:FontWeight.bold,
            color: Colors.deepPurple,
            ),),
          ),
        ),),),
     InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutApp()));
      },
      child: ProfileRow(myicon: Icons.warning, profileText: "About App")),
     ProfileRow(myicon: Icons.privacy_tip_outlined, profileText: "Privacy Polices"),
     ProfileRow(myicon: Icons.phone, profileText: "Contact Us"),
     InkWell(
      onTap: (){
       Logouthandler();
      },
      child: ProfileRow(myicon: Icons.logout, profileText: "Logout")),

      ],),);
  }
}
class ProfileRow extends StatelessWidget {
  IconData myicon;
  String profileText;
   ProfileRow({super.key,required this.myicon,required this.profileText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.10),
      child: Row(children: [
        Icon(myicon,color: Colors.black54,),
       const  SizedBox(width: 15,),
        Text(profileText,style: const TextStyle(fontWeight: FontWeight.bold),)
      ],),
    );
  }
}