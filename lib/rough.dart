// import 'package:auth/Admin/adminhome.dart';
// import 'package:auth/Admin/adminnav.dart';
// import 'package:auth/Admin/preview.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class Userorderdata extends StatefulWidget {
//   Map userdata;
//   Userorderdata({super.key, required this.userdata});
  


//   @override
//   State<Userorderdata> createState() => _UserorderdataState();
// }

// class _UserorderdataState extends State<Userorderdata> {
//   Map<String, dynamic> user = {};
//   List unApprovedTasks=[];
//   bool isLoading = true;

//   @override
//   void initState() {

//     print("object");
//     print(widget.userdata['uid']);
//     getuserdata();
//   }


//   // getAllUnApprovedTasks() async {
//   //   await FirebaseFirestore.instance
//   //       .collection("Trans")
//   //       .where("approved", isEqualTo: false)
//   //       .get()
//   //       .then((response) {
//   //     List<Map<String, dynamic>> tempRecords = [];
//   //     response.docs.forEach((element) { 
//   //       print(element.id);
//   //       tempRecords.add({...element.data(), "id": element.id});
//   //     });
//   //     setState(() {
//   //       unApprovedTasks = tempRecords;
//   //     });
//   //   });
//  // }





//   approvalhandler(){
//     FirebaseFirestore.instance
//         .collection("Trans")
//         .doc(widget.userdata['orderId']).update({
//           "approved":true
//         });
// }
//    getuserdata() async {
//   await  FirebaseFirestore.instance
//         .collection("UserDetail")
//         .doc(widget.userdata['uid'])
//         .get()
//         .then((response) {
//       if (response.exists) {
//         setState(() {
//         user = response.data()!;
//         isLoading = false;
//       });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? CircularProgressIndicator()
//         : 
//         Container(
//           margin: EdgeInsets.all(10),
//           color: Colors.amber,
//           child: Column(
            
//               children: [
//                  SizedBox(height: 30,),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
                  
//                 Text("Name"),
//                 SizedBox(width: 30,),
//                 Text(user['Name']),

//               ],),
//               SizedBox(height: 20,),
//                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                 Text("Email"),
//                 SizedBox(width: 30,),
//                 Text(user['Email']),

//               ],),
//                SizedBox(height: 20,),
//                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                 Text("Address"),
//                 SizedBox(width: 30,),
//                 Text(user['Address']),

//               ],),
//                 // Text(user['Name']),
//                  SizedBox(height: 30,),
//                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                         ElevatedButton(onPressed: (){
          
//                         }, child: Text("Reject")),
//                         SizedBox(width: 30,),
//                         ElevatedButton(onPressed: (){
//                         print(approvalhandler);
//                            showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//             title: Text('Hey Admin'),
//             content: Text('Order has been accepted'),
//             actions: [
//              IconButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> Adminnavigator()));
//              }, icon:  Icon(Icons.home))
//             ],
//         )
//     );
//                         approvalhandler();
//                         onPressed: () {
 
// };

//                       //  Navigator.pop(context);
                      

//                           print("hahhahahahahhahh");
//                         }, child: Text("Accept")),
//                         SizedBox(width: 30,),
//                          ElevatedButton(onPressed: (){
//                   // print(widget.userdata);
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Preview(ordersData: widget.userdata,)));
//                 }, child: Text("View"))
//                         ],),
               
//               ],
//             ),
//         );
//   }
// }