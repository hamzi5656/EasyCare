import 'package:auth/User/Categories/Fitness.dart';
import 'package:auth/User/Categories/HearingAids.dart';
import 'package:auth/User/Categories/Mobility.dart';
import 'package:auth/User/Categories/visualAids.dart';
import 'package:flutter/material.dart';
class PopularCategories extends StatelessWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
           
          const   SizedBox(height: 15,),
            Row(children: [
              InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Mobility()));
                },
                child: CategoriesWidget(Catimage: "asset/images/wheelchairred.jpg", categoriesText: "Chairs")),
             const SizedBox(width: 14,),
              InkWell(
                          onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> VisualAids()));
                },
                child: CategoriesWidget(Catimage: "asset/images/visusal.png", categoriesText: "Glasses")),
                const  SizedBox(width: 14,),
              InkWell(
                          onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HeaeringAids()));
                },
                child: CategoriesWidget(Catimage: "asset/images/hearing.jpg", categoriesText: "Hearing")),
               const   SizedBox(width: 14,),
              InkWell(
                          onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Fitness()));
                },
                child: CategoriesWidget(Catimage: "asset/images/shoes.jpg", categoriesText: "Shoes")),
             const  SizedBox(width: 14,),
                InkWell(
                            onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  Fitness()));
                },
                  child: CategoriesWidget(Catimage: "asset/images/youga mat.jpg", categoriesText: "Mat")),
               const   SizedBox(width: 14,),
           
            ],)
            
            
        
        
          ],),),
      ),
    );
  }
}
class CategoriesWidget extends StatelessWidget {
  final categoriesText;
  String Catimage;
  CategoriesWidget({super.key,required this.Catimage,required this.categoriesText});

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        CircleAvatar(
          radius: 30,
      backgroundImage:AssetImage(Catimage) ,),
      const SizedBox(height: 10,),
    Text(categoriesText),
    ],);
  }
}