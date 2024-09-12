import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/booking/book_page.dart';
import 'package:flutter_application_2/project1/body/fav/fav_page.dart';
import 'package:flutter_application_2/project1/body/home/main_page.dart';
import '../../../main.dart';
import '../Profile/profie_pag1.dart';

class Mainpage3 extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Mainpage3({super.key});

  @override
  State<Mainpage3> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage3> {
  int currentIndex = 3;
  final Screen = [
    const Menupage(),
    const Bookpage(),
    Cartpage(),
    const Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Icons.book,
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
    );
  }
}
