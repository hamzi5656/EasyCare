import 'package:auth/Admin/userpopular.dart';
import 'package:auth/Admin/dashboard.dart';
import 'package:auth/Admin/adminhome.dart';
import 'package:auth/User/Categories/categories.dart';
import 'package:auth/User/Home/HomeScreen.dart';
import 'package:auth/User/Profile/profile.dart';
import 'package:auth/User/favourite.dart';
import "package:auth/test.dart";
import "package:flutter/material.dart";

class Adminnavigator extends StatefulWidget {
  const Adminnavigator({super.key});

  @override
  State<Adminnavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<Adminnavigator> {
  List<IconData> navigationIcons = [
   Icons.home,
   Icons.store,
   Icons.circle,
   Icons.person,
  ];
  List<String> iconName = ["home", "store", " Favourite", "profile"];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: 
      IndexedStack(
        index: currentIndex,
        children:  [
       AdminHome(),
       ButtonScreen(),
         FavouriteScreen(),
         ProfileScreen(),

          ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.all(0
            ),
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Colors.white,
       
        ),
        child: Column(children: [
          Container(
            color: Colors.blueGrey,
            width: double.infinity,
            height: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < navigationIcons.length; i++) ...{
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = i;
                          });
                        },
                        child: Center(
                          child: Icon(
                            navigationIcons[i],
                            color: i == currentIndex
                                ? Colors.blueAccent
                                : Colors.black54,
                            size: i == currentIndex ? 30 : 25,
                          ),
                        ),
                      ),
                    )
                  },
                ]),
          ),
        ]),
      ),
    
    );
  }
}
