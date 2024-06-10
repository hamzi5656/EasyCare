import 'package:auth/User/Services/servicesDetail.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

        Widget serviceviewCard(context,
        String serviceimg,
        String servicename,
        String price,
        String timeduration,
        String createdBy,
        Function ontap,
        

        ) {
  return Container(margin: const EdgeInsets.only(left: 1,right: 10),
    height: MediaQuery.of(context).size.height * 0.32,
    width: MediaQuery.of(context).size.width * 0.45,
  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey.withOpacity(.2))),
   
    
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  SizedBox(
                                  height:MediaQuery.of(context).size.height * 0.17,
                                      width: MediaQuery.of(context).size.width * 0.45,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                                    child: 
                                    Image.asset(
                                      serviceimg,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                        top: 8,
                                        left: 5,
                                        child: Container(
                                          height: 30,
                                          width: 85,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(23),
                                              color:Colors.white
                                              ),
                                          child: Marquee(
                                            text: servicename,
                                            style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                                            blankSpace: 100,                    
                                            accelerationCurve: Curves.bounceInOut,
                                            pauseAfterRound: const Duration(seconds: 2),
                                            velocity: 30,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 3,
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(23),
                                              color: Colors.black),
                                          child: Center(
                                              child: Text(
                                            price,
                                           
                                          style: const TextStyle(color: Colors.white), 
                        
                                          )),
                                        ),
                                      ),
                                ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                   servicename ,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5,),
                                   Row(
                                    children: [
                                      const Text(
                                        "Duration  ",
                                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        timeduration,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 15,
                                      backgroundImage: AssetImage(
                                        "asset/images/admin.png"
                                      ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                         Text(
                                    createdBy,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  ],),                                
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
}