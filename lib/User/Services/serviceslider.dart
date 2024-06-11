import 'package:auth/User/Home/services.Home.dart';
import 'package:auth/User/Services/doctor.dart';
import 'package:auth/User/Services/servicesCategories/gymtrainer.dart';
import 'package:auth/User/Services/servicesDetail.dart';
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
        padding:  const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
          const Text("Services",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ServicesList()));
          },
            child: const Text("See All",style: TextStyle(color: Colors.deepPurple,fontSize: 16),))
        ],),
      ),
      const SizedBox(height: 20,),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Row(
            
            children: [
           InkWell(
            onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=> ServiceDetails()));
           
    },
             child: serviceviewCard(context, "asset/images/3.jpg", "Physiotherapist", "12992", "30 min", "Hamza",
              (){
             
              
             }),
           ),
            InkWell(
              onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=> DoctorService()));
           
    },
              child: serviceviewCard(context, "asset/images/doctorService.jpg", "Doctor", "12992", "30 min", "Dr Habib", (){})),
         
         
            InkWell(
              onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>   GymTrainer()));
           
    },
              child: serviceviewCard(context, "asset/images/gym.jpg", "Gym Trainner", "12992", "30 min", "Abdullah Meer", (){})),
           
          ],),
        ),
      )
    
    ],);
  
  
 
  }
}