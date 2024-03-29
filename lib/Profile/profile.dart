import 'package:auth/Home/Appbar.dart';
import 'package:auth/cart/CartScreen.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(title: Text("Profile",style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),
      body: Column(children: [
        SizedBox(height: 10,),
     Padding(
       padding: const EdgeInsets.only(),
       child: Container(height: 45,width: double.infinity,color: Colors.deepPurple.withOpacity(.1),
        child: Align(alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("GENERAL",style: TextStyle(fontWeight:FontWeight.bold,
            color: Colors.deepPurple,
            ),),
          ),
        ),),
      
     ),
     ProfileRow(myicon: Icons.favorite_outline, profileText: "Favourite Product"),
     ProfileRow(myicon: Icons.favorite_outline, profileText: "Favourite Services"),
     InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
     },
      child: ProfileRow(myicon: Icons.shopping_bag_outlined, profileText: "My Cart")),
      SizedBox(height: 10,),
     Padding(
       padding: const EdgeInsets.only(),
       child: Container(height: 45,width: double.infinity,color: Colors.deepPurple.withOpacity(.1),
        child: Align(alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("About App",style: TextStyle(fontWeight:FontWeight.bold,
            color: Colors.deepPurple,
            ),),
          ),
        ),),),
     ProfileRow(myicon: Icons.warning, profileText: "About App"),
     ProfileRow(myicon: Icons.privacy_tip_outlined, profileText: "Privacy Polices"),
     ProfileRow(myicon: Icons.phone, profileText: "Contact Us"),
     ProfileRow(myicon: Icons.logout, profileText: "Logout"),

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
        SizedBox(width: 15,),
        Text(profileText,style: TextStyle(fontWeight: FontWeight.bold),)
      ],),
    );
  }
}