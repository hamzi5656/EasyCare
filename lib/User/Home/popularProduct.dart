import 'package:auth/User/Product/productDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// class PopluarProducts extends StatefulWidget {
//   const PopluarProducts({super.key});

//   @override
//   State<PopluarProducts> createState() => _PopluarProductsState();
// }

// class _PopluarProductsState extends State<PopluarProducts> {
//   List<Map> allpopularProduct=[];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print("heloo");
//          getpopularproduct();
//   }
//   getpopularproduct(){
    
//     FirebaseFirestore.instance.collection("Product").where("popular", isEqualTo: true).get().then((response) {
//     List<Map<String,dynamic>> temp=[];
//      for (var element in response.docs) {
//        temp.add({...element.data(), "id":element.id });
//      }
//      allpopularProduct = temp; 
//     setState(() { });
//     print(allpopularProduct);
//     print("=====================");
    
//     });

   


//   }
//   @override

//   Widget build(BuildContext context) {
  
//     return 
//     Container(
//       child: Column(children: [
//       Product(productImage: "asset/images/wheelchair.jpg", productName: "Wheelchair", desc: "Handyman", price: 12344,prodDuration: "Duration:()",),
//     ],),);
//   }
// }
class Product extends StatelessWidget {
  // String productName,productImage,desc;
  // String prodDuration;
  // double price;
  Map productinfo;
  Product({super.key,required this.productinfo });
  

  @override
  Widget build(BuildContext context) {
       Timestamp durationTimestamp = productinfo['duration'];
    DateTime durationDateTime = durationTimestamp.toDate();

    // Extracting hours from DateTime object
    int hours = durationDateTime.hour;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
         ProductDetail(productDetails:productinfo ,

        ))); 
      },
      child:
       Container(margin: EdgeInsets.only(top: 10,left: 2,right: 2,bottom: 10),
        
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey.withOpacity(.2))),
        height: 280,width: 170,
       child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
          Image(height: 120,width: 120,
            image: NetworkImage(

           "${productinfo["img"]}")),
          SizedBox(height: 10,),
          Text("${productinfo["name"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Text(
                              "Duration: $hours hours",
                              style: TextStyle(fontSize: 16),
                            ),
          Text("${productinfo["description"]}",maxLines: 1,),
          Text( "${productinfo["price"]}".toString(),style: TextStyle(fontWeight: FontWeight.bold),),
          
              ],),
        ),),
    );
  }
}