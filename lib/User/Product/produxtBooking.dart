                    import 'package:auth/User/Home/HomeScreen.dart';
                    import 'package:flutter/material.dart';
                    class ProductBooking extends StatefulWidget {

                    const ProductBooking({super.key, });

                    @override
                    State<ProductBooking> createState() => _ServiceBookingState();
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
                                      (context)=>const HomeScreen()));
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
                    "Book Service",
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
                    Text("Product",),
                    Center(
                    child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 210, 220, 231),
                    borderRadius: BorderRadius.circular(15)),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Product Name",style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Description",style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    Text("Price",style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    ],
                    ),
                    Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                    image: 
                    AssetImage("asset/images/wheelchairred.jpg")
                    )),
                    )
                    ],
                    ),
                    ),
                    ),
                    Text(
                    "Your Address",

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
                    Text("Price Details",),
                    Center(
                    child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 210, 220, 231),
                    borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Column(
                    children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text("Product Price",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("3999",style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    ],
                    ),
                    const Divider(),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text("GST Tax",style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("340.0",style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    ],
                    ),
                    const Divider(),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text("Total Amount",style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("5800.0",style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    ],
                    ),
                    const Divider(),
                    ],
                    ),
                    ),
                    ),
                    ),
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
                    "Confirm Booking",
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