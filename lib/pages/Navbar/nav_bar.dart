import 'package:brook_woods01/pages/Navbar/profile_page.dart';
import 'package:brook_woods01/pages/home_page/material/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import '../home_page/home_page.dart';

class NavPage extends StatefulWidget {
  @override
  State<NavPage> createState() => _NavPage();
}

class _NavPage extends State<NavPage> {
  final pages = [
    HomePage(),
    CartProduct(),
    Profile(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Container(
          height: 50,
          color: kPrimaryColor,
          child: BottomNavigationBar(
              backgroundColor: kPrimaryColor,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(fontSize: 10, color: Colors.white),
              onTap: onTap,
              currentIndex: currentIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              showUnselectedLabels: false,
              showSelectedLabels: true,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.blueAccent.shade400,
                  icon: Icon(CupertinoIcons.house_fill),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.deepPurpleAccent.shade200,
                  label: "Cart",
                  icon: Icon(CupertinoIcons.cart),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  backgroundColor: Colors.blue.shade400,
                  icon: Icon(CupertinoIcons.person),
                ),
              ]),
        ));
  }
}
