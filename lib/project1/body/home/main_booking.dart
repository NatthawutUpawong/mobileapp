import 'package:flutter/material.dart';
import 'package:flutter_application_2/test/profile_page.dart';
import 'package:flutter_application_2/project1/body/booking/book_page.dart';
import 'package:flutter_application_2/project1/body/fav/fav_page.dart';
import 'package:flutter_application_2/project1/body/home/main_page.dart';
import '../../../main.dart';
import '../Profile/profie_pag1.dart';

class Mainbook extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Mainbook({super.key});

  @override
  State<Mainbook> createState() => _MainpageState();
}

class _MainpageState extends State<Mainbook> {
  int currentIndex = 1;
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
          selectedItemColor: iconunselect,
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
