import 'package:auth/User/Categories/Fitness.dart';
import 'package:auth/User/Categories/GymProduct.dart';
import 'package:auth/User/Categories/HearingAids.dart';
import 'package:auth/User/Categories/Medical.dart';
import 'package:auth/User/Categories/Mobility.dart';
import 'package:auth/User/Categories/sticks.dart';
import 'package:auth/User/Categories/visualAids.dart';
import 'package:auth/User/Home/popularCategories.dart';
import 'package:flutter/material.dart';
class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
    const Text("Categories",style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.deepPurple,),
   body: Padding(
   padding: const EdgeInsets.all(10.10),
   child: Column(children: [
     
     Padding(
       padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
       child: 
       Row(children: [ 
        InkWell(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> Mobility() ));
      
        },
          child: CategoriesWidget(Catimage: "asset/images/wheelchairred.jpg", categoriesText: "Mobility")),
       SizedBox(width: 30,),
       
      InkWell(onTap: (){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>const HeaeringAids() ));
      
      },
          child: CategoriesWidget(Catimage: "asset/images/hearing.jpg", categoriesText: "Hearing")),
       SizedBox(width: 30,),
        InkWell(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const VisualAids() ));
    
        },
          child: CategoriesWidget(Catimage: "asset/images/visusal.png", categoriesText: "visual")),
        SizedBox(width: 30,),
        InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sticks() ));
    
        },
          child: CategoriesWidget(Catimage: "asset/images/stick.jpg", categoriesText: "Sticks")),
       
         ],),
     ),
     SizedBox(height: 20,),
         Padding(
       padding: const EdgeInsets.only(top: 10,bottom: 20,right: 20,left: 20),
       child: 
       Row(children: [ 
        InkWell(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const Fitness() ));
    
        },
          child: CategoriesWidget(Catimage: "asset/images/fitness.jpg", categoriesText: "Fitness")),
       SizedBox(width: 30,),
       
      InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Medical() ));
    
      },
          child: CategoriesWidget(Catimage: "asset/images/medical.jpg", categoriesText: "Medical")),
       SizedBox(width: 30,),
        InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const GymProducts() ));
    
        },
          child: CategoriesWidget(Catimage: "asset/images/gym.jpg", categoriesText: "Gym")),
        SizedBox(width: 30,),
       
       
         ],),
     ),
     SizedBox(height: 20,),
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