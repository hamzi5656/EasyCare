// import 'package:flutter/material.dart';
// class ServiceDetail extends StatelessWidget {
//   const ServiceDetail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text("Service Detail",style: TextStyle(color: Colors.white),),
//     backgroundColor: Colors.deepPurple,),
//     body:const  Column(children: [
      
//       Expanded(flex: 3,
//         child: Image(image: AssetImage("asset/images/physiotherapist.jpg"))),
//           Expanded(flex: 3,
//       child: Column(
//         children: [
//        Card(child:
//         Padding(
//           padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
//           child: Column(mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//          Text("Physiotherapist",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
//             SizedBox(height: 10,),
//           Text("Description:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
//           Text("A little and short description of product or services that will be add in this application",style: TextStyle(fontSize: 16),),
//          SizedBox(height: 10,),
//           Text("800/hr",style: TextStyle(fontWeight:FontWeight.bold,
//             color: Colors.deepPurple,fontSize: 20
//             ),),
//           SizedBox(height: 10,),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Location:",style: TextStyle(fontSize: 16,),),
//               Text("Lahore",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              
//             ]
// ),
//        SizedBox(height: 10,),
//       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Status:",style: TextStyle(fontSize: 16,),),
//               Text("In Stock",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              
//             ]
// ),
//      SizedBox(height: 10,),
//       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Hire Me:",style: TextStyle(fontSize: 16,),),
//               Text("03115373314",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              
//             ]
// ),
// ],),
// ),),
// // Card(
// //   child: Padding(
// //     padding: EdgeInsets.only(top: 20,left: 20,right: 10,bottom: 20),
// //     child: Column(mainAxisAlignment: MainAxisAlignment.start,
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: [
// //     Text("Reviews",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
// //     SizedBox(height: 15,),
// //     Text("There will be the Reviwes of user for this service")
// //     ],),
// //   ),)
  
//   ],))
   
//     ],),
//     );
  
//   }
// }



//ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const, non_constant_identifier_names, prefer_const_constructors_in_immutables


import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


class ServiceDetails extends StatefulWidget {
  
  ServiceDetails({super.key, });

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
             Stack(
               children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                     color: Colors.grey.withOpacity(.2),
                     ),
                   
               Container(
                    height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                         AssetImage("asset/images/gym.jpg"),
                    fit:BoxFit.fill )
                    ),
                  ),
                    Positioned(top: 20,
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(
                        Icons.arrow_back,color: Colors.black,
                        ))),
                   Positioned(
                    top: 190,left: 15,right: 15,
                     child: Column(
                           children: [
                             Container(
                              height: MediaQuery.of(context).size.height*0.22,
                              width: MediaQuery.of(context).size.width*0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(
                                    "Physiotherapist",
style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),                              
                                  ),
                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Price:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                      Text("1200",style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                         Text("Duration:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                      Text("30 min",style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],),
                              ),
                                             ),
                            Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                         Text(
                                           "Description:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                          
                                         ),  
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                         Text("Short Description of the services and services provider user",
                         ), 
                          
                           /////////////////////////////////////////////
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  Text(
                                        "Avalible At",
                                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                                       ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                       Container(
                                         height: MediaQuery.of(context).size.height*0.05,
                              width: MediaQuery.of(context).size.width*0.5,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(.8),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: 
                             Text("Abbottabad",
                              style:TextStyle(color: Colors.white,fontSize: 16) ,
                              )),
                                       ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                          Text(
                                        "About Provider",
                                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                                       ), 
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                        InkWell(
                                          // onTap: (){
                                          //   Navigator.push(context, MaterialPageRoute(builder: 
                                          //   (context)=> Test()));
                                          // },
                                          child: Card(
                                             child: Padding(
                                                                 padding: const EdgeInsets.all(12),
                                                                 child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                   children: [
                                                                    CircleAvatar(
                                             backgroundImage:AssetImage("asset/images/gym.jpg") ,
                                           backgroundColor: Colors.blueGrey,
                                            radius: 30,
                                          ), 
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                          
                                          Text(
                                          "Jhon Wick",
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                          "Physiotherapist",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          
                                          ],
                                          ),
                                          ],
                                          ),
                                          ),
                                          ),
                                        ),                              
                                      
        SizedBox(height: 20,),
        Container(
          height: 60,width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.deepPurple.withOpacity(.8)),
          child: TextButton(onPressed: (){}, child: Text("Hire Me",style: TextStyle(color: Colors.white),)))
                                     
                                      ],
                                     ),
                                    
]  ),

                     
                                 ),
            //                      Positioned(
            //                       bottom: 10,
            //                       left: 5,
            //                       right: 5,
            //                       child:
            //                       FloatingActionButton(
            //                         onPressed: (){
            //                          Navigator.push(
            // context,MaterialPageRoute(
            // builder: (context) =>  )
            // );
            //                       },
            //                       backgroundColor: Colors.deepPurple.withOpacity(.8),
            //                       child: Text("Book Now",
            //                       style:TextStyle(color: Colors.white,fontSize: 16) ,
            //                       ),
            //                       )
            //                       )
                          
                         
                           ],
                         ),
          ]
                       ),
               
                     ),             
    );
  }
}