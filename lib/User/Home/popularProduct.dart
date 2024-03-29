import 'package:auth/User/Product/productDetail.dart';
import 'package:flutter/material.dart';
class PopluarProducts extends StatelessWidget {
  const PopluarProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
      Product(productImage: "asset/images/wheelchair.jpg", productName: "Wheelchair", desc: "Handyman", price: 12344,prodDuration: "Duration:()",),
    ],),);
  }
}
class Product extends StatelessWidget {
  String productName,productImage,desc;
  String prodDuration;
  double price;
  Product({super.key,required this.productImage,required this.productName ,required this.desc,required this.price,required this.prodDuration});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail()));
      },
      child: Card(
        //height: 230,width: 160,decoration: BoxDecoration(color: Colors.grey.withOpacity(.1),borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [       
          Image(height: 120,width: 120,
            image: AssetImage(
            "asset/images/wheelchairred.jpg")),
          SizedBox(height: 10,),
          Text(productName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Text(prodDuration),
          Text(desc,maxLines: 1,),
          Text(price.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
          
              ],),
        ),),
    );
  }
}