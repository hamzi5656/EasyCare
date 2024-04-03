import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Column(children: [
      Expanded(flex:3,
        child: 
   Container(
  child: Stack(children: [    Center(child: Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Image(image: AssetImage("asset/images/wheelchairred.jpg")),
  )),
  
  Positioned(top: 30,right: 30,
    child: Icon(Icons.favorite_outline,size: 28,)
    ),
    Positioned(top: 30,left: 10,
    child:IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back))
    ),
  
    ],),
),
    ),
    Expanded(flex: 3,
      child: Column(
        children: [
       Card(child:
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Text("WheelChair",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
          Text("Description:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Text("A little and short description of product or services that will be add in this application",style: TextStyle(fontSize: 16),),
         SizedBox(height: 10,),
          Text("8999",style: TextStyle(fontWeight:FontWeight.bold,
            color: Colors.deepPurple,fontSize: 20
            ),),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Duration:",style: TextStyle(fontSize: 16,),),
              Text("30 min",style: TextStyle(fontSize: 16,)),
              
            ]
),
        const SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status:",style: TextStyle(fontSize: 16,),),
              Text("In Stock",style: TextStyle(fontSize: 16,)),
              
            ]
)
],),
),),
Card(
  child: Padding(
    padding: const EdgeInsets.only(top: 20,left: 20,right: 10,bottom: 20),
    child: Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text("Reviews",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
    SizedBox(height: 15,),
    Text("There will be the Reviwes of user that will be against the product ")
    ],),
  ),)
  ],))
   
    ]
    ,),

    bottomSheet: Container(color: Colors.deepPurple,
      height: 80,child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
      TextButton(onPressed: (){},child: Text("Counter",
        style: TextStyle(color: Colors.white,fontSize: 20),),),
        // PersistentShoppingCart().showAndUpdateCartItemWidget(
        //   inCartWidget: Text("remow"), 
        //   notInCartWidget: Text("add"),
        //    product: PersistentShoppingCartItem(
        //     productId: "12",
        //      productName: "12",
        //       unitPrice: 12,
        //        quantity: 12))
        //  PersistentShoppingCart().showAndUpdateCartItemWidget(
        //             inCartWidget: 
        //              SizedBox(width: double.infinity,
        //                child: Container(height: 55,
        //                decoration: BoxDecoration(color: Colors.white,
        //                 borderRadius: BorderRadius.circular(10),
        //                 border: Border.all(color: Colors.red)),
        //                  child: Center(
        //                    child: Text("Remove",
        //                    style: TextStyle(fontWeight: FontWeight.bold,
        //                     fontSize: 18,
        //                    color: Colors.black),),
        //                  ),
        //                ),
        //              ),
        //             notInCartWidget:
        //              SizedBox(width: double.infinity,
        //                child: Container(height: 55,
        //                decoration: BoxDecoration(color: Colors.blue,
        //                 borderRadius: BorderRadius.circular(10)),
        //                  child: Center(
        //                    child: Text("Add to cart",
        //                    style: TextStyle(
        //                     fontSize: 18,
        //                    color: Colors.white),),
        //                  ),
        //                ),
        //              ),
        //              product: PersistentShoppingCartItem(
        //               productId: "123", 
                      
        //               productName: "`123",
        //                unitPrice: double.parse("123"), 
        //                quantity: 123)),
                  
        ],),),
        );
  }
}