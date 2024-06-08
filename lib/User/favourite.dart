// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:auth/User/Home/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  List userDetails = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initjkhjkhkj sthhate");
  
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("LLLLLLLLLLLLLLLLL");
  }
  
    getUserData() {
    FirebaseFirestore.instance
        .collection("UserDetail")
        .doc() 
        .get()
        .then((res) {
     print(userDetails);

    });
  
  }
  
  @override
  Widget build(BuildContext context) {
    return
     Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 90,
          left: 25,
          right: 25,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Center(
                      child: Text(
                        "${userDetails["favProd"]}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_rounded,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Father name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.join_inner,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Joining Date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                             
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person_4_outlined,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Age',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lightbulb_circle,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('skills',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail_outline,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                             
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        Positioned(
          bottom: 90,
          left: 80,
          child: Container(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff821DFB),
                  minimumSize: Size(220, 50),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  String? getUserId() {}
}
