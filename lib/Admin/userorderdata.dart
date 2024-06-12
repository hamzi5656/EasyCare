

import 'package:auth/Admin/adminnav.dart';
import 'package:auth/Admin/fullscreen.dart';
import 'package:auth/Admin/preview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Userorderdata extends StatefulWidget {
  final Map userdata;
  Userorderdata({super.key, required this.userdata});

  @override
  State<Userorderdata> createState() => _UserorderdataState();
}

class _UserorderdataState extends State<Userorderdata> {
  Map<String, dynamic> user = {};
  String? imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getuserdata();
  }

  approvalhandler() {
    FirebaseFirestore.instance
        .collection("Trans")
        .doc(widget.userdata['orderId'])
        .update({"approved": true});
  }

  getuserdata() async {
    await FirebaseFirestore.instance
        .collection("UserDetail")
        .doc(widget.userdata['uid'])
        .get()
        .then((response) {
      if (response.exists) {
        setState(() {
          user = response.data()!;
        });
      }
    });

    await FirebaseFirestore.instance
        .collection("Trans")
        .doc(widget.userdata['orderId'])
        .get()
        .then((response) {
      if (response.exists) {
        setState(() {
          imageUrl = response.data()!['imageUrl'];
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.amber,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Name"),
                      SizedBox(width: 30),
                      Text(user['Name']),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Email"),
                      SizedBox(width: 30),
                      Text(user['Email']),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Address"),
                      SizedBox(width: 30),
                      Text(user['Address']),
                    ],
                  ),
                  SizedBox(height: 30),
              GestureDetector(
      onTap: () {
        if (imageUrl != null && imageUrl!.isNotEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  width: double.infinity,
                  height: 400,
                  child: PhotoView(
                    imageProvider: NetworkImage(imageUrl!),
                  ),
                ),
              );
            },
          );
        } else {
          // Handle null or empty imageUrl case here
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image URL is not valid')),
          );
        }
      },
      child: imageUrl != null
          ? Image.network(
              imageUrl!,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text('Image failed to load'),
                );
              },
            )
          : Text("No image available"),
    ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Reject button logic
                        },
                        child: Text("Reject"),
                      ),
                      SizedBox(width: 30),
                      ElevatedButton(
                        onPressed: () {
                          approvalhandler();
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Hey Admin'),
                              content: Text('Order has been accepted'),
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Adminnavigator()));
                                  },
                                  icon: Icon(Icons.home),
                                )
                              ],
                            ),
                          );
                        },
                        child: Text("Accept"),
                      ),
                      SizedBox(width: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Preview(ordersData: widget.userdata)));
                        },
                        child: Text("View"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        );
  }
}

