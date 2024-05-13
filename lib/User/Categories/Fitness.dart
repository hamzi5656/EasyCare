import 'package:auth/User/Product/productDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Fitness extends StatefulWidget {
  const Fitness({super.key});

  @override
  State<Fitness> createState() => _MobilityState();
}

class _MobilityState extends State<Fitness> {
  List<Map> allMobility=[];
  @override

   void initState() {
      // TODO: implement initState
      super.initState();

      getMobilityProducts();
      }
   getMobilityProducts(){

      FirebaseFirestore.instance.collection("Product").where("category", isEqualTo: "fitness").where("popular", isEqualTo: false).get().then((response) {
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
        title: Text("Fitness",style: TextStyle(color: Colors.white),),
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
                  Divider(),
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
                      
                      Text(e['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      
                      Text(e['description'],maxLines: 2,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal)),
                       Text(e['status'].toString() == true ? "Out of stock"  :"In Stock ",),
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