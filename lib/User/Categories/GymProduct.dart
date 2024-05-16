import 'package:auth/User/Product/productDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class GymProducts extends StatefulWidget {
  const GymProducts({super.key});

  @override
  State<GymProducts> createState() => _MobilityState();
}

class _MobilityState extends State<GymProducts> {
  List<Map> allMobility=[];
  @override

   void initState() {
      // TODO: implement initState
      super.initState();

      getMobilityProducts();
      }
   getMobilityProducts(){

      FirebaseFirestore.instance.collection("Product").where("category", isEqualTo: "Gym").where("popular", isEqualTo: false).get().then((response) {
      List<Map<String,dynamic>> temp=[];
      for (var element in response.docs) {
      temp.add({...element.data(), "id":element.id });
      }
      allMobility = temp; 
      setState(() { });
      print(allMobility);
      print("=====================");  

      });
      }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gym ",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            ...allMobility.map((e) =>
            // Text(e['name'])
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(productDetails: e)));
              },
              child: Card(margin: EdgeInsets.all(15),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                     ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),),
                  child: Image(image: NetworkImage(e['img']),
                  width: double.infinity,
                  height: 180,fit: BoxFit.cover,
                             ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(e['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text("Description",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      
                      Text(e['description'],maxLines: 2,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(.6))),
                      SizedBox(height: 5,),
                      Row(children: [
                        Icon(Icons.star,size: 16,color: Colors.green,),
                        Icon(Icons.star,size: 16,color: Colors.green,),
                        Icon(Icons.star,size: 16,color: Colors.green,),
                        Icon(Icons.star,size: 16,color: Colors.green,),
                        ],),
                        SizedBox(height: 5,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Status"), Text(e['status'].toString() == true ? "Out of stock"  :"In Stock ",),],)
                ],
                  ),
                )
              
                ],),),
            )
            
            
            )
            ],),
        ),
        
);
  }
}