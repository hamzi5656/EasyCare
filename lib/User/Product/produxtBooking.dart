                    import 'dart:io';

import 'package:auth/User/Home/HomeNavigator.dart';
import 'package:auth/User/Home/HomeScreen.dart';
                    import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
                    class ProductBooking extends StatefulWidget {
                      

                    const ProductBooking({super.key, });

                    @override
                    State<ProductBooking> createState() => _ServiceBookingState();
                    }
                     bool isImageSelected = false;

      File? _imgFile;
    
      void takeSnapshot() async {
        final ImagePicker picker = ImagePicker();
        final XFile? img = await picker.pickImage(
          source: ImageSource.gallery);
        if (img == null) return;
        print(img.path);
        print("=================");
        
          _imgFile = File(img.path); // convert it to a Dart:io file
      setState(() {  });

          print(_imgFile);
        print("==========++++++++++++++++++++=======");
      }
    
  
  void setState(Null Function() param0) {
  }

                    class _ServiceBookingState extends State<ProductBooking> {
                    final TextEditingController _Address = TextEditingController();
                    @override
                    Widget build(BuildContext context) {
                    processPayment(){
                    Future.delayed(
                    const Duration(seconds: 5),
                    () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    showDialog(context: context, builder: (context)=> AlertDialog(
                    title: const Icon(
                    Icons.task_alt_rounded,
                    size: 70,
                    color: Colors.deepPurple,
                    ),
                    content:  const SizedBox(
                    height: 100,
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text("Thank You",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    Text("Your Booking is Confirmed"),
                    ],
                    ),
                    ),
                    actions: [
                    Center(
                    child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: Colors.deepPurple
                                ),   
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: 
                                      (context)=>const HomeNavigator()));
                                    },
       child: const Text("Back to Home",style: TextStyle(color: Colors.white,fontSize: 16),)),
                    ),

                    ],
                    ));

                    });

                    showDialog(context: context, builder: (context)=> const AlertDialog(
                    title: SizedBox(
                    height: 70,
                    ),
                    content:  SizedBox(
                    height: 100,
                    child: Center(
                    child: CircularProgressIndicator(),
                    ),
                    ),
                    actions: [SizedBox(
                    height: 50,
                    )],
                    ));


                    }
                    return Scaffold(
                    appBar: AppBar(
                    leading: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    ),
                    title: const Text(
                    "Buy Product",
                    style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
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
                         MaterialButton(
                color: Colors.deepPurple,
                child: const Text("Attach File",
                    style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  takeSnapshot();
                }),
                Container(child:
                _imgFile  != null?
                 Image.file(_imgFile! ,height: 200,width: double.infinity,):
                  Text(
                    "Error",

                    ),
                 
                 ), 
                  
                    TextFormField(
                    controller: _Address,

                    decoration: InputDecoration(
                    fillColor: const Color(0xffE8ECF8),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                    color: Colors.transparent), // Change this color
                    borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                    hintText: "Enter Your City",
                    prefixIcon: const Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    ),

                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                    return "This Field cannot be empty";
                    }
                    if (!regex.hasMatch(value)) {
                    return "Please enter your City name";
                    }
                    return null;
                    },
                    ),
                    // Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // children: [
                    // TextButton(
                    // onPressed: () {},
                    // child: Text(
                    // "Choose From Map",

                    // )),
                    // TextButton(
                    // onPressed: () {},
                    // child: Text(
                    // "Use Current Location",

                    // )),
                    // ],
                    // ),
                 SizedBox(height: 20,),
                    Text("Description",),
                    SizedBox(
                    child: TextFormField(
                    controller: _Address,

                    decoration: InputDecoration(
                    fillColor: const Color(0xffE8ECF8),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                    color: Colors.transparent), // Change this color
                    borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 20.0),
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
                    SizedBox(height: 20,),
                    Text("Here is ou easypaisa account number send your amount on this for confirming your product"),
                SizedBox(height: 10,),
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround ,
                  children: [
                   Text("Account Number"), 
                   Text("03115373314")
                   ],),
                   SizedBox(height: 10,),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround ,
                  children: [
                   Text("Account Name"), 
                   Text("Hamza Saleem")
                   ],),
//




                    SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height*0.07,
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
                    content:  const SizedBox(
                    height: 100,
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text("Confirm Booking",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    Text("Do You Want to Confirm this Booking?"),
                    ],
                    ),
                    ),
                    actions: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    maximumSize: const Size(110, 50),
                    backgroundColor: Colors.white
                    ),                              
                    onPressed: () {
                    Navigator.pop(context);
                    },
                    child: const Text("Cancle",style: TextStyle(color: Colors.black,fontSize: 17,),)),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    maximumSize: const Size(110, 50),
                    backgroundColor: Colors.deepPurple
                    ), 
                    onPressed: processPayment,

                    child: const Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 16),)),
                    ],
                    ),

                    ],
                    );
                    },
                    );
                    },
                    backgroundColor: Colors.deepPurple,
                    child: const Text(
                    "order Now",
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