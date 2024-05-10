import 'package:auth/User/Product/produxtBooking.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Cart",
      style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),
      
      body: Column(
        children: [
 Expanded(flex: 6 ,

   child: PersistentShoppingCart().showCartItems(
    cartTileWidget: ({required data})=> Card(child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(height: 100,width: 100,
          image: NetworkImage(data.productThumbnail.toString(),)),
          SizedBox(width: 0,),
          Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(data.productName,style: TextStyle(fontWeight: FontWeight.bold),),
            Text("${data.unitPrice}")
            ],),
               Column(
                  children: [
                    IconButton(onPressed: (){
                                  PersistentShoppingCart().incrementCartItemQuantity(data.productId);  },
                                   icon: Icon(Icons.add),iconSize: 20,),
                                   Text(data.quantity.toString()),
                    IconButton(onPressed: (){
                                  PersistentShoppingCart().decrementCartItemQuantity(data.productId);  },
                                   icon: Icon(Icons.minimize_outlined),iconSize: 20,),
                  ],
                ),

     
            IconButton(onPressed: (){
              PersistentShoppingCart().removeFromCart(data.productId);  },
               icon: Icon(Icons.delete)),
             
      ],) ,), 
      
    showEmptyCartMsgWidget: Text("No data")),
 ),
 
Expanded(flex: 1,
  child:  
  PersistentShoppingCart().showTotalAmountWidget(
  cartTotalAmountWidgetBuilder: (totalAmount){
    return Text("Total Amount:  "+ totalAmount.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    );
  }) )

      ],),
      bottomSheet: Container(height: 70,width: double.infinity,
         color:Colors.deepPurple,child: Center(child: InkWell(onTap: ()
         {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductBooking()));
         },
          child: Text("Check out",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),),);
  }
}