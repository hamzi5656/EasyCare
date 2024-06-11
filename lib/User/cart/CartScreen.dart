import 'dart:io';

import 'package:auth/User/Product/productDetail.dart';
import 'package:auth/User/Product/produxtBooking.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
class CartScreen extends StatelessWidget {
 var productData;
  CartScreen({super.key,});
   bool isImageSelected = false;

      File? _imgFile;
    
      void takeSnapshot() async {
        final ImagePicker picker = ImagePicker();
        final XFile? img = await picker.pickImage(
          source: ImageSource.gallery);
        if (img == null) return;
        print(img.path);
        print("=================");
        
          _imgFile = File(img.path); // convert it to a Dart:io file
      setState(() {  });

          print(_imgFile);
        print("==========++++++++++++++++++++=======");
      }
    
  
  void setState(Null Function() param0) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text("Cart",
      style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),
      
      body: Column(
        children: [
 Expanded(flex: 6 ,

   child:
    PersistentShoppingCart().showCartItems(
    cartTileWidget:  ({required data}){
     
 
      return  Card(child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(height: 100,width: 100,
          image: NetworkImage(data.productThumbnail.toString(),)),
          const SizedBox(width: 0,),
          Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(data.productName,style: const TextStyle(fontWeight: FontWeight.bold),),
            Text("${data.unitPrice}")
            ],),
               Column(
                  children: [
                    IconButton(onPressed: (){
                                  PersistentShoppingCart().incrementCartItemQuantity(data.productId);  },
                                   icon: const Icon(Icons.add),iconSize: 20,),
                                   Text(data.quantity.toString()),
                    IconButton(onPressed: (){
                                  PersistentShoppingCart().decrementCartItemQuantity(data.productId);  },
                                   icon: const Icon(Icons.minimize_outlined),iconSize: 20,),
                  ],
                ),

     
            IconButton(onPressed: (){
              PersistentShoppingCart().removeFromCart(data.productId);  },
               icon: const Icon(Icons.delete)),
             
      ],) ,);
      
    },
    showEmptyCartMsgWidget: const Text("No data")),
 
 ),
 Expanded(
  flex: 1,
  
  child: Column(children: [
                            MaterialButton(
                color: Colors.deepPurple,
                child: const Text("Attach File",
                    style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  takeSnapshot();
                }),
                Container(child:
                _imgFile  != null?
                 Image.file(_imgFile! ,height: 200,width: double.infinity,):
                  const 
                  Text(
                    "img",

                    ),
                 
                 ),
 ],),),
 
Expanded(flex: 1,
  child:  
  PersistentShoppingCart().showTotalAmountWidget(
  cartTotalAmountWidgetBuilder: (totalAmount){

    return Text("Total Amount:  $totalAmount",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    );
  }) )

      ],),
      bottomSheet: Container(height: 70,width: double.infinity,
         color:Colors.deepPurple,child: Center(child: InkWell(onTap: ()
         {
  
         Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProductBooking()));
         },
          child: const Text("Check out",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),),);
  }
}