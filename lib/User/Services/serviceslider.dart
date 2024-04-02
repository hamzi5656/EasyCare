import 'package:auth/User/Home/services.Home.dart';
import 'package:auth/User/Services/serviceslist.dart';
import 'package:flutter/material.dart';
class ServicesSliderHome extends StatelessWidget {
  const ServicesSliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding:  EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
          Text("Services",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ServicesList()));
          },
            child: Text("See All",style: TextStyle(color: Colors.deepPurple,fontSize: 16),))
        ],),
      ),
      SizedBox(height: 20,),
      serviceviewCard(context, "asset/images/gym.jpg", "Physiotherapist", "12992", "30 min", "Hamza", (){}),

    
    ],);
  
  
 
  }
}