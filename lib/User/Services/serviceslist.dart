import 'package:auth/User/Services/servicesCategories/doctor.dart';
import 'package:auth/User/Services/servicesCategories/gymtrainer.dart';
import 'package:auth/User/Services/servicesCategories/physcatrist.dart';
import 'package:auth/User/Services/servicesDetail.dart';
import 'package:flutter/material.dart';
class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("All Services"),),
    body: Column(children: [
  InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Doctor()));
    },
    child: ServicesRow(imageurl: "https://icon-library.com/images/admin-user-icon/admin-user-icon-4.jpg",
     serviceText: "Doctor"),
  ),
  InkWell(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> GymTrainer()));
    },
    child: ServicesRow(imageurl: "https://cdn.pixabay.com/photo/2024/01/10/05/32/ai-generated-8498914_640.jpg", serviceText: "Gym Trainer")),
  InkWell(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ServiceDetails()));
    },
    child: ServicesRow(imageurl: "https://e7.pngegg.com/pngimages/1007/41/png-clipart-physical-therapist-assistant-physical-therapy-saddleridge-physiotherapy-clinic-physio-child-physical-fitness-thumbnail.png", serviceText: "Physiotherapist")),
  InkWell(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Physcatrist()));
    },
    child: ServicesRow(imageurl: "https://w7.pngwing.com/pngs/121/666/png-transparent-dr-vikas-thanvi-neuropsychiatry-psychiatrist-neurology-brain-thumbnail.png", serviceText: "psychiatrist"))
   
   
   ],),
   
   
    );
  }
}
 class ServicesRow extends StatelessWidget {
  String imageurl,serviceText;
 ServicesRow({super.key,required this.imageurl,required this.serviceText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
             
          CircleAvatar(backgroundColor: Colors.white,
            child: Image.network(imageurl)),
          SizedBox(width: 20,),
          Text(serviceText,style: TextStyle(fontWeight: FontWeight.bold),)
              ],),
        ),),
    );
  }
}