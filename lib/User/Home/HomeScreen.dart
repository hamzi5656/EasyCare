
        import 'package:auth/User/Home/Searchbar.dart';
        import 'package:auth/User/Home/popularCategories.dart';
        import 'package:auth/User/Home/popularProduct.dart';
        import 'package:auth/User/Home/slider.dart';
        import 'package:auth/User/cart/CartScreen.dart';
        import 'package:flutter/material.dart';
        class HomeScreen extends StatelessWidget {
        const HomeScreen({super.key});

        @override
        Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(title:const  Text("EasyCare",
        style:TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,actions: [
        Badge(child: InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const  CartScreen()));
        },
        child: const Icon(Icons.shopping_bag,color: Colors.white,)),)
        ],),
        body: 
        SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        const   SizedBox(height: 10,),
        HomeSlider(),
        const   SizedBox(height: 20,),
        const  HomeSearchBar(),
        const   SizedBox(height: 10,),
        const   Align(alignment: Alignment.topLeft,
          child: Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
        const   SizedBox(height: 20,),

        const   PopularCategories(),
        const    SizedBox(height: 50,),
          Row(children: 
        [
        Container(color: Colors.amber,height: 150,width: 180),
        Container(color: Colors.black26,height:150,width: 180)],),
        const   Align(alignment: Alignment.topLeft,
          child: Text("Popular Product",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
        const  SizedBox(height: 30,),
        const  PopluarProducts()

        ],),
        ),
        )
        );
        }
        }