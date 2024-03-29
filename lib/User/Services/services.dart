import 'package:auth/User/Services/servicesDetail.dart';
import 'package:flutter/material.dart';
class ServiesScreen extends StatelessWidget {
  const ServiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Services",style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),
    body:   Column(children: [

     InkWell(
     onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ServiceDetail() ));
    
     },
       child: Card(margin: EdgeInsets.only(top: 20,left: 30,right: 30,bottom: 20),
        child: Padding(
          padding:  EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Image(height: 200,width: double.infinity,
            image: AssetImage("asset/images/physiotherapist.jpg"),
            
          ),
          SizedBox(height: 20,),
               Text("Physiotherapist",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal ),),
              SizedBox(height: 10,),
              Text("A little desciption of the services of user that they want to the customer with the application Easycare")
               ],),
        ),),
     )
    ],),
    );
  }
}
