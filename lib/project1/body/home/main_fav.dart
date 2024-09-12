import 'package:flutter/material.dart';
import 'package:flutter_application_2/test/profile_page.dart';
import 'package:flutter_application_2/project1/body/booking/book_page.dart';
import 'package:flutter_application_2/project1/body/fav/fav_page.dart';
import 'package:flutter_application_2/project1/body/home/main_page.dart';
import '../../../main.dart';
import '../Profile/profie_pag1.dart';

class Mainfav extends StatefulWidget {
  Mainfav({super.key});

  @override
  State<Mainfav> createState() => _MainpageState();
}

class _MainpageState extends State<Mainfav> {
  int currentIndex = 2;
  final Screen = [
    const Menupage(),
    const Bookpage(),
    Cartpage(),
    const Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: mediumColor,
          selectedItemColor: iconColor,
          showUnselectedLabels: false,
          onTap: (index) => setState(() => currentIndex = index),
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: iconColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.perm_device_information_rounded,
                  color: iconColor,
                ),
                label: "Booking"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: iconColor,
                ),
                label: "Like"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: iconColor,
                ),
                label: "Profile"),
          ]),
    ));
  }
}
