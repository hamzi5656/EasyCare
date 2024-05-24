
      import 'package:auth/Admin/dltprod.dart';
import 'package:auth/User/Categories/categories.dart';
      import 'package:auth/User/Home/Searchbar.dart';
      import 'package:auth/User/Home/popularCategories.dart';
      import 'package:auth/User/Home/popularProduct.dart';
      import 'package:auth/User/Home/services.Home.dart';
      import 'package:auth/User/Home/slider.dart';
      import 'package:auth/User/Product/productDetail.dart';
      import 'package:auth/User/Services/serviceslider.dart';
      import 'package:auth/User/Services/serviceslist.dart';
      import 'package:auth/User/cart/CartScreen.dart';
      import 'package:cloud_firestore/cloud_firestore.dart';
      import 'package:flutter/foundation.dart';
      import 'package:flutter/material.dart';
      import 'package:persistent_shopping_cart/model/cart_model.dart';
      import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
      class AllProducts extends StatefulWidget {
      const AllProducts({super.key});

      @override
      State<AllProducts> createState() => _AllProductsState();
      }

      class _AllProductsState extends State<AllProducts> {

      List<Map> allpopularProduct=[];
      @override
      void initState() {
   
      print("==================");

      getpopularproduct();
     
      }
      
      getpopularproduct(){

      FirebaseFirestore.instance.collection("Product").where("popular", isEqualTo: true, ).get().then((response) {
      
      
      List<Map<String,dynamic>> temp=[];
      for (var element in response.docs) {
      temp.add({...element.data(), "id":element.id });
      }
      allpopularProduct = temp; 
      setState(() { });
      print(allpopularProduct);
      print("=====================");

      });
      }
      

      @override
      Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title:const  Text("All Products",
      style:TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,
     
      ),
      body: 
      SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const  SizedBox(height: 20,),
      //services
      // ServicesSliderHome(),
      SizedBox(height: 20,),
      Align(alignment: Alignment.topLeft,
      child: Text("Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      const  SizedBox(height: 10,),
      Container(padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Wrap(
      children: [
      ...allpopularProduct.map((e) =>
      dltprod(productinf: e))
      // Product(productinfo: e)),
     
     
      ],


      ),)


      ])
      )
      ));

      }}