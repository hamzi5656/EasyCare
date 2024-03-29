import 'package:flutter/material.dart';
class ServiceDetail extends StatelessWidget {
  const ServiceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Service Detail",style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.deepPurple,),
    body:const  Column(children: [
      
      Expanded(flex: 3,
        child: Image(image: AssetImage("asset/images/physiotherapist.jpg"))),
          Expanded(flex: 3,
      child: Column(
        children: [
       Card(child:
        Padding(
          padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Text("Physiotherapist",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
          Text("Description:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Text("A little and short description of product or services that will be add in this application",style: TextStyle(fontSize: 16),),
         SizedBox(height: 10,),
          Text("800/hr",style: TextStyle(fontWeight:FontWeight.bold,
            color: Colors.deepPurple,fontSize: 20
            ),),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Location:",style: TextStyle(fontSize: 16,),),
              Text("Lahore",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              
            ]
),
       SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status:",style: TextStyle(fontSize: 16,),),
              Text("In Stock",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              
            ]
),
     SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hire Me:",style: TextStyle(fontSize: 16,),),
              Text("03115373314",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              
            ]
),
],),
),),
// Card(
//   child: Padding(
//     padding: EdgeInsets.only(top: 20,left: 20,right: 10,bottom: 20),
//     child: Column(mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text("Reviews",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//     SizedBox(height: 15,),
//     Text("There will be the Reviwes of user for this service")
//     ],),
//   ),)
  
  ],))
   
    ],),
    );
  
  }
}