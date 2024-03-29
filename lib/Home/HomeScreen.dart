import 'package:auth/Home/Appbar.dart';
import 'package:auth/Home/HomeNavigator.dart';
import 'package:auth/Home/Searchbar.dart';
import 'package:auth/Home/popularCategories.dart';
import 'package:auth/Home/popularProduct.dart';
import 'package:auth/Home/slider.dart';
import 'package:auth/cart/CartScreen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EasyCare",
    style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,actions: [
      Badge(child: InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
      },
        child: Icon(Icons.shopping_bag,color: Colors.white,)),)
      ],),
      body: 
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
          SizedBox(height: 10,),
          HomeSlider(),
          SizedBox(height: 20,),
         HomeSearchBar(),
         SizedBox(height: 10,),
          Align(alignment: Alignment.topLeft,
            child: Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
     SizedBox(height: 20,),
 
         PopularCategories(),
         SizedBox(height: 50,),
             Row(children: 
     [Container(color: Colors.amber,height: 150,width: 180),
     Container(color: Colors.black26,height:150,width: 180)],),
          Align(alignment: Alignment.topLeft,
            child: Text("Popular Product",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
         SizedBox(height: 30,),
         PopluarProducts()
          
        ],),
      ),
    )
    );
  }
}