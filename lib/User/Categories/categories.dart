import 'package:auth/User/Categories/Fitness.dart';
import 'package:auth/User/Categories/GymProduct.dart';
import 'package:auth/User/Categories/HearingAids.dart';
import 'package:auth/User/Categories/Medical.dart';
import 'package:auth/User/Categories/Mobility.dart';
import 'package:auth/User/Categories/sticks.dart';
import 'package:auth/User/Categories/visualAids.dart';
import 'package:auth/User/Home/popularCategories.dart';
import 'package:auth/User/cart/CartScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
    const Text("Categories",style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.deepPurple,
    actions: [  PersistentShoppingCart().showCartItemCountWidget(
      cartItemCountWidgetBuilder: ((itemCount) =>
      IconButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> 
    CartScreen()));
      },
       icon: Badge(
      label: Text(itemCount.toString()),
      child: const Icon(Icons.shopping_bag,color: Colors.white,),
      ))
      ))
    
    ],
    ),
   body: Padding(
   padding: const EdgeInsets.all(10.10),
   child: Column(children: [
     
     Padding(
       padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
       child: 
       Row(children: [ 
        InkWell(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> const Mobility() ));
      
        },
          child: CategoriesWidget(Catimage: "asset/images/wheelchairred.jpg", categoriesText: "Mobility")),
       const SizedBox(width: 30,),
       
      InkWell(onTap: (){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>const HeaeringAids() ));
      
      },
          child: CategoriesWidget(Catimage: "asset/images/hearing.jpg", categoriesText: "Hearing")),
       const SizedBox(width: 30,),
        InkWell(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const VisualAids() ));
    
        },
          child: CategoriesWidget(Catimage: "asset/images/visusal.png", categoriesText: "visual")),
        const SizedBox(width: 30,),
        InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sticks() ));
    
        },
          child: CategoriesWidget(Catimage: "asset/images/stick.jpg", categoriesText: "Sticks")),
       
         ],),
     ),
     const SizedBox(height: 20,),
         Padding(
       padding: const EdgeInsets.only(top: 10,bottom: 20,right: 20,left: 20),
       child: 
       Row(children: [ 
        InkWell(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const Fitness() ));
    
        },
          child: CategoriesWidget(Catimage: "asset/images/fitness.jpg", categoriesText: "Fitness")),
       const SizedBox(width: 30,),
       
      InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Medical() ));
    
      },
          child: CategoriesWidget(Catimage: "asset/images/medical.jpg", categoriesText: "Medical")),
       const SizedBox(width: 30,),
        InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const GymProducts() ));
    
        },
          child: CategoriesWidget(Catimage: "asset/images/gym.jpg", categoriesText: "Gym")),
        const SizedBox(width: 30,),
       
       
         ],),
     ),
     const SizedBox(height: 20,),
   //    Padding(
      //  padding: const EdgeInsets.all(8.0),
      //  child: 
      //  Row(children: [ 
      //   InkWell(onTap: (){},
      //     child: CategoriesWidget(Catimage: "asset/images/wheelchair.jpg", categoriesText: "Fitness")),
      //  SizedBox(width: 30,),
       
      // InkWell(onTap: (){},
      //     child: CategoriesWidget(Catimage: "asset/images/wheelchair.jpg", categoriesText: "Fitness")),
      //  SizedBox(width: 30,),
      //   InkWell(onTap: (){},
      //     child: CategoriesWidget(Catimage: "asset/images/wheelchair.jpg", categoriesText: "Fitness")),
      //   SizedBox(width: 30,),
      //   InkWell(onTap: (){},
      //     child: CategoriesWidget(Catimage: "asset/images/wheelchair.jpg", categoriesText: "Fitness")),
       
      //   ],),
   //  ),
  ],),
),
    );
  }
}