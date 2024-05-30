
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
      class HomeScreen extends StatefulWidget {
      const HomeScreen({super.key});

      @override
      State<HomeScreen> createState() => _HomeScreenState();
      }

      class _HomeScreenState extends State<HomeScreen> {

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
      appBar: AppBar(title:const  Text("EasyCare",
      style:TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,
      actions: [
      PersistentShoppingCart().showCartItemCountWidget(
      cartItemCountWidgetBuilder: ((itemCount) =>
      IconButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> 
      CartScreen()));
      }, icon: Badge(
      label: Text(itemCount.toString()),
      child: Icon(Icons.shopping_bag,color: Colors.white,),
      ))
      ))
      ],
      ),
      body: 
      SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
      padding: const EdgeInsets.all(10.0),
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
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: 
      [
      InkWell(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductCategories() ));

      },
      child: Container(
      decoration: BoxDecoration(color: Colors.white,

      ),
      height: MediaQuery.of(context).size.height*0.152,
      width: MediaQuery.of(context).size.width*0.45,
      child: ClipRRect(borderRadius: BorderRadius.circular(20),
      child: Image.network("https://plus.unsplash.com/premium_photo-1672883552384-087b8a7acdb6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y29sbGVjdGlvbiUyMG9mJTIwcmFuZG9tJTIwcHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D%27")),)),
      InkWell(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ServicesList() ));

      },
      child: Container(color: Colors.white,
      height: MediaQuery.of(context).size.height*0.152,
      width: MediaQuery.of(context).size.width*0.45,
      child: ClipRRect(borderRadius: BorderRadius.circular(20),
      child: Image.network("https://cdn.pixabay.com/photo/2015/06/10/16/36/mark-804938_640.jpg"))))],),

      const  SizedBox(height: 20,),
      //services
      ServicesSliderHome(),
      SizedBox(height: 20,),

      Align(alignment: Alignment.topLeft,
      child: Text("Popular Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      const  SizedBox(height: 10,),
      Container(padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Wrap(
      children: [
      ...allpopularProduct.map((e) => Product(productinfo: e)),
      ],


      ),)


      ])
      )
      ));

      }}