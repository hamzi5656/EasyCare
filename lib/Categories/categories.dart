import 'package:auth/Home/popularCategories.dart';
import 'package:flutter/material.dart';
class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
    Text("Categories",style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.deepPurple,),
body: Padding(
  padding: const EdgeInsets.all(10.10),
  child: Column(children: [
     
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: 
       Row(children: [ 
        CategoriesWidget(Catimage: "asset/images/wheelchair.jpg", categoriesText: "Fitness"),
       SizedBox(width: 30,),
       
        CategoriesWidget(Catimage: "asset/images/wheelchairred.jpg", categoriesText: "Fitness"),
        SizedBox(width: 30,),
         CategoriesWidget(Catimage: "asset/images/wheelchair2.jpg", categoriesText: "Fitness"),
           SizedBox(width: 30,),
         CategoriesWidget(Catimage: "asset/images/wheelchair2.jpg", categoriesText: "Fitness"),
        
         ],),
     ),
     SizedBox(height: 20,),
         Padding(
       padding: const EdgeInsets.all(8.0),
       child: 
       Row(children: [ 
        CategoriesWidget(Catimage: "asset/images/wheelchair.jpg", categoriesText: "Fitness"),
       SizedBox(width: 30,),
       
        CategoriesWidget(Catimage: "asset/images/wheelchairred.jpg", categoriesText: "Fitness"),
        SizedBox(width: 30,),
         CategoriesWidget(Catimage: "asset/images/wheelchair2.jpg", categoriesText: "Fitness"),
           SizedBox(width: 30,),
         CategoriesWidget(Catimage: "asset/images/wheelchair2.jpg", categoriesText: "Fitness"),
        
         ],),
     ) ,
     SizedBox(height: 20,),
         Padding(
       padding: const EdgeInsets.all(8.0),
       child: 
       Row(children: [ 
        CategoriesWidget(Catimage: "asset/images/wheelchair.jpg", categoriesText: "Fitness"),
       SizedBox(width: 30,),
       
        CategoriesWidget(Catimage: "asset/images/wheelchairred.jpg", categoriesText: "Fitness"),
        SizedBox(width: 30,),
         CategoriesWidget(Catimage: "asset/images/wheelchair2.jpg", categoriesText: "Fitness"),
           SizedBox(width: 30,),
         CategoriesWidget(Catimage: "asset/images/wheelchair2.jpg", categoriesText: "Fitness"),
        
         ],),
     )                                
  ],),
),
    );
  }
}