import 'package:flutter/material.dart';
class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About US",style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,),
      body: SingleChildScrollView(
        child: SafeArea(
        child: Column
        (mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
        color: Colors.grey.withOpacity(.2),
            child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("EasyCare: \nYour Accessible Hub for Disability Products & Services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text(" Easycare is an innovative application designed to cater to the needs of individuals with disabilities by providing a comprehensive range of products and services tailored to enhance their quality of life. With a user-friendly interface and a focus on accessibility, \nEasyCare aims to empower users with disabilities, enabling them to navigate daily tasks with greater ease and independence.",style: TextStyle(fontSize: 16),),
             SizedBox(height: 20,),
              Text("Empowerment at Your Fingertips.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("EasyCare offers a curated selection of disability-friendly products and essential services, all in one place. From mobility aids to home modifications, find what you need effortlessly. Accessible, inclusive, and designed for you",style: TextStyle(fontSize: 16),)
            , SizedBox(height: 10,),
            Text("1. Streamlined Experience:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            
            SizedBox(height: 5,),
            Text("EasyCare provides a seamless user experience with its single-page application design. Users can easily navigate through the entire range of products and services without having to switch between multiple pages or tabs.",style: TextStyle(fontSize: 16),)
            , SizedBox(height: 5,),
            Text("2. Quick Search Functionality: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            
            SizedBox(height: 5,),
            Text("With EasyCare, finding the right products and services is quick and hassle-free. The application features a robust search functionality that allows users to search by keyword, category, or specific criteria, ensuring that they can locate what they need with just a few clicks.",style: TextStyle(fontSize: 16),)
                ,SizedBox(height: 5,),
                  Text("3. Responsive Design: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
             SizedBox(height: 5,),
             Text("EasyCare is built with a responsive design, making it accessible across various devices and screen sizes. Whether users are accessing the application from a desktop computer, tablet, or smartphone, they can enjoy a consistent and optimized experience.",style: TextStyle(fontSize: 16),)
              ],),
          )
          )],),
            ),
      )
    )
    ;}
}