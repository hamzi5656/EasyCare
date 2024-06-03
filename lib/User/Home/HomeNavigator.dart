import 'package:auth/User/Categories/categories.dart';
import 'package:auth/User/Home/HomeScreen.dart';
import 'package:auth/User/Profile/profile.dart';
import 'package:auth/User/favourite.dart';
import "package:flutter/material.dart";

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  List<IconData> navigationIcons = [
   Icons.home,
   Icons.category_outlined,
   Icons.favorite_outline,
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
        children:const  [
         HomeScreen(),
         ProductCategories(),
         Profileuser(),
        
         ProfileScreen(),

          ],
      ),
      bottomNavigationBar: Container(
        height: 82,
        margin: const EdgeInsets.all(0
            ),
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Colors.white,
       
        ),
        child: Column(children: [
          Container(
            color: Colors.black,
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
