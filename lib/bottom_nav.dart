// ignore_for_file: prefer_const_constructors

// import 'dart:html';

import 'dart:html';

import 'package:animated_bottom_nav/AccountPage.dart';
import 'package:animated_bottom_nav/HomePage.dart';
import 'package:animated_bottom_nav/MessagesPage.dart';
import 'package:animated_bottom_nav/NotificationPage.dart';
import 'package:animated_bottom_nav/TaskPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Bottom_nav extends StatefulWidget {
  const Bottom_nav({Key? key}) : super(key: key);

  @override
  Bottom_navState createState() => Bottom_navState();
}

// ignore: camel_case_types
class Bottom_navState extends State<Bottom_nav> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final Screens = [
    HomePage(),
    TaskPage(),
    MessagesPage(),
    NotificationPage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.task, size: 30, color: Colors.white),
      Icon(Icons.message, size: 30, color: Colors.white),
      Icon(Icons.notification_add, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white),
    ];
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Center(child: Text("Animated Bottom Navigation")),
        actions: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: 10),
            ],
          ),
        ],
        // title: Text(
        //   "Ecommerce Application",
        //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // ),
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 65, 222, 233),
      ),
      body: Screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          items: items,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          color: Color.fromARGB(255, 65, 222, 233),
          backgroundColor: Colors.transparent,
          index: index,
          height: 60,
          buttonBackgroundColor: Color.fromARGB(255, 65, 222, 233),
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
