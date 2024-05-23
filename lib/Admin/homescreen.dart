import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AdminHome extends StatefulWidget {
 
  const AdminHome({super.key,});

  @override
  State<AdminHome> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminHome> {
  TextEditingController _productTitle = TextEditingController();
  TextEditingController _productPrice = TextEditingController();
  TextEditingController _productqty = TextEditingController();
  TextEditingController _productUnit = TextEditingController();

  TextEditingController _productDesc = TextEditingController();

  File? tempImage;
  XFile? pickedImage;

  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then(
      (value) {
        if (value != null) {
          print(value.path);
          setState(() {
            pickedImage = value;
            tempImage = File(value.path);
          });
        } else {
          print(null);
        }
      },
    );
  }

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  addProductHandler() async {
    print("step1");
    EasyLoading.show(status: "Loading...");
    try {
    print("step2");

      String uid = await FirebaseAuth.instance.currentUser!.uid;
    print("step3");

      String imageUrl = "";
      print(pickedImage!.path);
      if (pickedImage != null) {
        Reference ref = FirebaseStorage.instance
            .ref()
            .child("prodimg/${pickedImage!.name}");
        File imageFile = File(pickedImage!.path);
        await ref.putFile(imageFile);
        imageUrl = await ref.getDownloadURL();
        setState(() {});
      }
      // GeoFirePoint Location = GeoFlutterFire().point(
      //     latitude: _adLocation.latitude, longitude: _adLocation.longitude);

     
      await FirebaseFirestore.instance.collection("Product").doc().set({
        "name": _productTitle.text,
        "price": int.parse(_productPrice.text),
        "Img": imageUrl,
        "name": _productTitle.text,
        "ProductPrice": 10000,
        "FeatueredImage": imageUrl,
        // "SalePercent": 20,
        // "isSale": false,
        // "storeID": widget.storeDetail["id"],
        // "Seller": widget.storeDetail["sellerID"],
        "CreatedAt": Timestamp.now(),
        "Qty": 20, //int.parse(_productqty.text),
      }).then((value) {
        EasyLoading.showSuccess("Product Uploaded");
      });
    } on FirebaseException catch (e) {
      EasyLoading.showError(e.code);
      print(e);
    } catch (e) {
      EasyLoading.showError(e.toString());
      print(e);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(("adLocation"));
  }

  printStore() {
    print("data");
  }

  // List<Map<String, String>> variations = [];

  // TextEditingController variationNameController = TextEditingController();
  // TextEditingController variationSizeController = TextEditingController();

  // void addVariation() {
  //   setState(() {
  //     variations.add({
  //       'name': variationNameController.text,
  //       'size': variationSizeController.text,
  //     });
  //     // Clear text controllers after adding a variation
  //     variationNameController.clear();
  //     variationSizeController.clear();
  //   });
  // }

  // void deleteVariation(int index) {
  //   setState(() {
  //     variations.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFCF8),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        child: ListView(scrollDirection: Axis.vertical, children: [
          SizedBox(height: 25),
          Stack(
            children: [
              Container(
                height: 200, 
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Color(0xff7743DB),
                  ),
                ),
                width: double.infinity,
                child: pickedImage != null
                    ? ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        child: Image.file(tempImage!, fit: BoxFit.cover))
                    : ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        child:
                            Image.asset("asset/images/gym.jpg", fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: InkWell(
                  onTap: uploadImage,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff7743DB),
                    radius: 30,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextInputFieldWithoutIcon("Product Title", _productTitle,
              "Product Name", TextInputType.text, (p0) {}),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextInputFieldWithoutIcon("Item Quantity", _productqty,
                      "1", TextInputType.text, (p0) {}),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextInputFieldWithoutIcon("Unit", _productUnit, "Pair",
                      TextInputType.text, (p0) {}),
                ),
              ],
            ),
          ),
          TextInputFieldWithoutIcon("Price (Pkr)", _productPrice, "Rs 150",
              TextInputType.text, (p0) {}),
          // ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: variations.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(
          //             'Name: ${variations[index]['name']} | Size: ${variations[index]['size']}'),
          //         trailing: IconButton(
          //           icon: Icon(Icons.delete),
          //           onPressed: () => deleteVariation(index),
          //         ),
          //       );
          //     }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color.fromARGB(48, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    // Text("${_adLocation.latitude}"),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.pin_drop),
                    ),
                  ],
                ),
              ),

              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.pin_drop),
              // ),
         
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context)
              //         .push(
              //             MaterialPageRoute(builder: (context) => MapSample()))
              //         .then((result) {
              //       if (result != null) {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //           SnackBar(content: Text('Received data: $result')),
              //         );
              //         setState(() {
              //           _adLocation = result;
              //         });
              //       }
              //     });
              //   },
              //   child: Text("Open Map"),
              // ),
         
         
            ],
          ),
          Row(
            children: [
              Transform.scale(
                  scale: 1,
                  child: Switch(
                    onChanged: toggleSwitch,
                    value: isSwitched,
                    activeColor: Color(0xffE8ECF8),
                    activeTrackColor: Colors.blue,

                    // activeTrackColor: Color(0xffE8ECF8),
                    inactiveThumbColor: Color(0xffE8ECF8),
                    inactiveTrackColor: Colors.blue,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Variable Product',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  Text('Does this product have Different Prices'),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          ElevatedButton(onPressed: addProductHandler, child: Text("Add Product")),
        ]),
      ),
    );
  }
}
Widget TextInputFieldWithoutIcon(
  String label,
  TextEditingController editingController,
  String textHint,
  TextInputType keyBoardType,
  String? Function(String?)? validation,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.inter().fontFamily,
            color: Color(0xff000000),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          keyboardType: keyBoardType,
          controller: editingController,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w200,
            fontFamily: GoogleFonts.inter().fontFamily,
            color: Color(0xff000000),
          ),
          decoration: InputDecoration(
            fillColor: Color(0xffFFFFFF),
            //  Color(0xffF7F8F9),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color(0xffD8DADC)), // Change this color
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF7F8F9)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: textHint,

            hintStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.inter().fontFamily,
              color: Color(0xff8391A1),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validation,
        ),
      ],
    ),
  );
}