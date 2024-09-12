import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/Profile/profie_pag1.dart';
import 'package:flutter_application_2/project1/body/booking/book_page.dart';
import 'package:flutter_application_2/project1/body/fav/fav_page.dart';
import 'package:flutter_application_2/project1/body/home/main_page.dart';
import '../../../main.dart';

class Mainpage extends StatefulWidget {
  Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int currentIndex = 0;
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
          unselectedItemColor: iconunselect,
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
