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
           
            SizedBox(height: 15,),
            Row(children: [
              CategoriesWidget(Catimage: "asset/images/wheelchairred.jpg", categoriesText: "Dumb"),
              SizedBox(width: 10,),
              CategoriesWidget(Catimage: "asset/images/wheelchair.jpg", categoriesText: "Blind"),
                  SizedBox(width: 10,),
              CategoriesWidget(Catimage: "asset/images/wheelchair2.jpg", categoriesText: "Deaf"),
                  SizedBox(width: 10,),
              CategoriesWidget(Catimage: "asset/images/wheelchair3.jpg", categoriesText: "Fitness"),
               SizedBox(width: 10,),
                CategoriesWidget(Catimage: "asset/images/wheelchair2.jpg", categoriesText: "Medical"),
                  SizedBox(width: 10,),
           
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
      SizedBox(height: 10,),
    Text(categoriesText),
    ],);
  }
}