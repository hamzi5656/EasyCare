// import 'dart:io';

// import 'package:auth/User/Home/HomeNavigator.dart';
// import 'package:auth/User/Home/HomeScreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:persistent_shopping_cart/model/cart_model.dart';
// import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

// class ProductBooking extends StatefulWidget {
//   ProductBooking({
//     super.key,
//   });
//   @override
//   State<ProductBooking> createState() => _ServiceBookingState();
// }

// bool isImageSelected = false;

// File? _imgFile;

// void takeSnapshot() async {
//   final ImagePicker picker = ImagePicker();
//   final XFile? img = await picker.pickImage(source: ImageSource.gallery);
//   if (img == null) return;
//   print(img.path);
//   print("=================");

//   _imgFile = File(img.path); // convert it to a Dart:io file
//   setState(() {});

//   print(_imgFile);
//   print("==========++++++++++++++++++++=======");
// }




// setItemInFireBase(List myList){

// FirebaseFirestore.instance.collection("Trans").add({
//   "uid":FirebaseAuth.instance.currentUser!.uid,

//   "items":myList,
//   "approved":false,
// });
// }

// void setState(Null Function() param0) {}

// class _ServiceBookingState extends State<ProductBooking> {
//   final TextEditingController _Address = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     processPayment() {
//       Map<String, dynamic> cartData = PersistentShoppingCart().getCartData();
//       List<dynamic> myList = [];
//       List<PersistentShoppingCartItem> cartItems = cartData['cartItems'];
//       double totalPriceFromData = cartData['totalPrice'];
//       for (var cartitem in cartItems) {
//         myList.add(cartitem.productId);

//       }
//       setItemInFireBase(myList);
//       Future.delayed(const Duration(seconds: 5), () {
//         Navigator.of(context).pop();
//         Navigator.of(context).pop();
//         showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//                   title: const Icon(
//                     Icons.task_alt_rounded,
//                     size: 70,
//                     color: Colors.deepPurple,
//                   ),
//                   content: const SizedBox(
//                     height: 100,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           "Thank You",
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.w600),
//                         ),
//                         Text("Your Booking is Confirmed"),
//                       ],
//                     ),
//                   ),
//                   actions: [
//                     Center(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8)),
//                               backgroundColor: Colors.deepPurple),
//                           onPressed: () {
//                             PersistentShoppingCart().clearCart();
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const HomeNavigator()));
//                           },
//                           child: const Text(
//                             "Back to Home",
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           )),
//                     ),
//                   ],
//                 ));
//       });

//       showDialog(
//           context: context,
//           builder: (context) => const AlertDialog(
//                 title: SizedBox(
//                   height: 70,
//                 ),
//                 content: SizedBox(
//                   height: 100,
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//                 actions: [
//                   SizedBox(
//                     height: 50,
//                   )
//                 ],
//               ));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(
//           Icons.arrow_back_ios,
//           color: Colors.white,
//         ),
//         title: const Text(
//           "Buy Product",
//           style: TextStyle(
//               color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
//         ),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TextFormField(
//                 controller: _Address,
//                 decoration: InputDecoration(
//                   fillColor: const Color(0xffE8ECF8),
//                   filled: true,
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                         color: Colors.transparent), // Change this color
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide:
//                         const BorderSide(color: Colors.deepPurpleAccent),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
//                   hintText: "Enter Your City",
//                   prefixIcon: const Icon(
//                     Icons.location_on_outlined,
//                     size: 20,
//                   ),
//                 ),
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   RegExp regex = RegExp(r'^.{6,}$');
//                   if (value!.isEmpty) {
//                     return "This Field cannot be empty";
//                   }
//                   if (!regex.hasMatch(value)) {
//                     return "Please enter your City name";
//                   }
//                   return null;
//                 },
//               ),
//               // Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // children: [
//               // TextButton(
//               // onPressed: () {},
//               // child: Text(
//               // "Choose From Map",

//               // )),
//               // TextButton(
//               // onPressed: () {},
//               // child: Text(
//               // "Use Current Location",

//               // )),
//               // ],
//               // ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Description",
//               ),
//               SizedBox(
//                 child: TextFormField(
//                   controller: _Address,
//                   decoration: InputDecoration(
//                     fillColor: const Color(0xffE8ECF8),
//                     filled: true,
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Colors.transparent), // Change this color
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.deepPurpleAccent),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
//                     hintText: "Enter Your Address",
//                     prefixIcon: const Icon(
//                       Icons.location_on_outlined,
//                       size: 20,
//                     ),
//                   ),
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) {
//                     RegExp regex = RegExp(r'^.{6,}$');
//                     if (value!.isEmpty) {
//                       return "Address cannot be empty";
//                     }
//                     if (!regex.hasMatch(value)) {
//                       return "Please enter your Address";
//                     }
//                     return null;
//                   },
//                 ),
//               ),

//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                   "Here is our easypaisa account number send your amount on this for confirming your order"),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [Text("Account Number"), Text("03115373314")],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [Text("Account Name"), Text("Hamza Saleem")],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               MaterialButton(
//                   color: Colors.deepPurple,
//                   child: const Text("Attach File",
//                       style: TextStyle(color: Colors.white)),
//                   onPressed: () async {
//                     takeSnapshot();
//                   }),
//               Container(
//                 child: _imgFile != null
//                     ? Image.file(
//                         _imgFile!,
//                         height: 200,
//                         width: double.infinity,
//                       )
//                     : const Text(
//                         "Error",
//                       ),
//               ),

// //

//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.02,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 width: MediaQuery.of(context).size.width,
//                 child: FloatingActionButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: const Icon(
//                             Icons.expand_circle_down_outlined,
//                             size: 70,
//                             color: Colors.deepPurple,
//                           ),
//                           content: const SizedBox(
//                             height: 100,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   "Confirm Booking",
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Text("Do You Want to Confirm this Booking?"),
//                               ],
//                             ),
//                           ),
//                           actions: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                         maximumSize: const Size(110, 50),
//                                         backgroundColor: Colors.white),
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text(
//                                       "Cancle",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 17,
//                                       ),
//                                     )),
//                                 ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                         maximumSize: const Size(110, 50),
//                                         backgroundColor: Colors.deepPurple),
//                                     onPressed: processPayment,
//                                     child: const Text(
//                                       "Confirm",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 16),
//                                     )),
//                               ],
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   backgroundColor: Colors.deepPurple,
//                   child: const Text(
//                     "order Now",
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:auth/User/Home/HomeNavigator.dart';
import 'package:auth/User/Home/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductBooking extends StatefulWidget {
  ProductBooking({
    super.key,
  });
  @override
  State<ProductBooking> createState() => _ServiceBookingState();
}

bool isImageSelected = false;

File? _imgFile;

void takeSnapshot() async {
  final ImagePicker picker = ImagePicker();
  final XFile? img = await picker.pickImage(source: ImageSource.gallery);
  if (img == null) return;
  print(img.path);
  print("=================");

  _imgFile = File(img.path); // convert it to a Dart:io file
  setState(() {});

  print(_imgFile);
  print("==========++++++++++++++++++++=======");
}

Future<String?> uploadImage(File image) async {
  try {
    // Upload to Firebase Storage
    String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.png';
    UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    return downloadURL;
  } catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}

Future<void> setItemInFireBase(List myList, String? imageUrl) async {
  await FirebaseFirestore.instance.collection("Trans").add({
    "uid": FirebaseAuth.instance.currentUser!.uid,
    "items": myList,
    "approved": false,
    "imageUrl": imageUrl, // Add the image URL to the document
  });
}

void setState(Null Function() param0) {}

class _ServiceBookingState extends State<ProductBooking> {
  final TextEditingController _Address = TextEditingController();
  final TextEditingController _city = TextEditingController();

  void processPayment() async {
    Map<String, dynamic> cartData = PersistentShoppingCart().getCartData();
    List<dynamic> myList = [];
    List<PersistentShoppingCartItem> cartItems = cartData['cartItems'];
    double totalPriceFromData = cartData['totalPrice'];
    for (var cartitem in cartItems) {
      myList.add(cartitem.productId);
    }

    // Upload the image and get the URL
    String? imageUrl;
    if (_imgFile != null) {
      imageUrl = await uploadImage(_imgFile!);
    }

    await setItemInFireBase(myList, imageUrl);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Icon(
                  Icons.task_alt_rounded,
                  size: 70,
                  color: Colors.deepPurple,
                ),
                content: const SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Thank You",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text("Your Booking is Confirmed"),
                    ],
                  ),
                ),
                actions: [
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.deepPurple),
                        onPressed: () {
                          PersistentShoppingCart().clearCart();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeNavigator()));
                        },
                        child: const Text(
                          "Back to Home",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  ),
                ],
              ));
    });

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: SizedBox(
                height: 70,
              ),
              content: SizedBox(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              actions: [
                SizedBox(
                  height: 50,
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: const Text(
          "Buy Product",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // TextFormField(
              //   controller:_city ,
              //   decoration: InputDecoration(
              //     fillColor: const Color(0xffE8ECF8),
              //     filled: true,
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(color: Colors.transparent), // Change this color
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(color: Colors.deepPurpleAccent),
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //     contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
              //     hintText: "Enter Your City",
              //     prefixIcon: const Icon(
              //       Icons.location_on_outlined,
              //       size: 20,
              //     ),
              //   ),
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   validator: (value) {
              //     RegExp regex = RegExp(r'^.{6,}$');
              //     if (value!.isEmpty) {
              //       return "This Field cannot be empty";
              //     }
              //     if (!regex.hasMatch(value)) {
              //       return "Please enter your City name";
              //     }
              //     return null;
              //   },
              // ),
            
            
              const SizedBox(
                height: 20,
              ),
              const Text("Address"),
              SizedBox(
                child: TextFormField(
                  controller: _Address,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffE8ECF8),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent), // Change this color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                    hintText: "Enter Your Address",
                    prefixIcon: const Icon(
                      Icons.location_on_outlined,
                      size: 20,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return "Address cannot be empty";
                    }
                    if (!regex.hasMatch(value)) {
                      return "Please enter your Address";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(color: Colors.white,
                
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text("Note",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      const Text("Here is our easypaisa account number send your amount on this for confirming your order",style: TextStyle(fontWeight: FontWeight.normal),),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text("Account Number",style: TextStyle(fontWeight: FontWeight.bold),), Text("03115373314",style: TextStyle(fontWeight: FontWeight.bold))],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Account Name",style: TextStyle(fontWeight: FontWeight.bold)), Text("Hamza Saleem",style: TextStyle(fontWeight: FontWeight.bold))],
                      ),
                    ],
                  ),
                ),
              ),
              
              
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                  color: Colors.deepPurple,
                  child: const Text("Attach File", style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    takeSnapshot();
                  }),
              Container(
                child: _imgFile != null
                    ? Image.file(
                        _imgFile!,
                        height: 200,
                        width: double.infinity,
                      )
                    : const Text(
                        "No image selected",
                      ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Icon(
                            Icons.expand_circle_down_outlined,
                            size: 70,
                            color: Colors.deepPurple,
                          ),
                          content: const SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Confirm Booking",
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                                ),
                                Text("Do You Want to Confirm this Booking?"),
                              ],
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        maximumSize: const Size(110, 50),
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    )),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        maximumSize: const Size(110, 50),
                                        backgroundColor: Colors.deepPurple),
                                    onPressed: processPayment,
                                    child: const Text(
                                      "Confirm",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    )),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  backgroundColor: Colors.deepPurple,
                  child: const Text(
                    "Order Now",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




