import 'package:auth/models/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class dltprod extends StatefulWidget {
  Map productinf;
  dltprod({super.key, required this.productinf});

  @override
  State<dltprod> createState() => _dltprodState();
}

class _dltprodState extends State<dltprod> {
     void initState() {
   
      print("step 1 ______________");

      
     
      }
      

  @override
  Widget build(BuildContext context) {
    Timestamp durationTimestamp = widget.productinf['duration'];
    DateTime durationDateTime = durationTimestamp.toDate();

    // Extracting hours from DateTime object
    int hours = durationDateTime.hour;
    return Container(margin: EdgeInsets.only(top: 10,left: 2,right: 2,bottom: 10),
     
     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey.withOpacity(.2))),
     height: 320,width: 170,
    child: Padding(
       padding: const EdgeInsets.all(10.0),
       child: Column(mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
         children: [ 
          
       Image(height: 120,width: 120,
         image: NetworkImage(
    
        "${widget.productinf["img"]}")),
       SizedBox(height: 10,),
       Text("${widget.productinf["name"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
       Text(
                           "Duration: $hours hours",
                           style: TextStyle(fontSize: 16),
                         ),
       Text("${widget.productinf["description"]}",maxLines: 1,),
       Text( "${widget.productinf["price"]}".toString(),style: TextStyle(fontWeight: FontWeight.bold),),
    IconButton(onPressed: (){

      Get.defaultDialog(
                      title: 'Delete Product',
                      content: const Text(
                          'Are you sure want to delete this product'),
                      textCancel: 'Cancel',
                      textConfirm: 'Delete',
                      contentPadding: const EdgeInsets.all(10.0),
                      confirmTextColor: Colors.white,
                      onCancel: () {},
                      onConfirm: () async {
                        Get.back();
                        EasyLoading.show(status: 'Please wait');
                        await deleteImageFireBaseStore(widget.productinf['img']);
                        await FirebaseFirestore.instance
                            .collection('Product')
                            .doc(widget.productinf['id'])
                            .delete().then((value) => EasyLoading.showSuccess("Product Deleted"));
                      });
    }, icon: Icon(Icons.delete))
           ],),
     ),);
  }

  Future deleteImageFireBaseStore(String imageUrl) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = firebaseStorage.refFromURL(imageUrl);
    await reference.delete();
  }
}
