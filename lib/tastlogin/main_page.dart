import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/home/Homescreen.dart';
import 'package:flutter_application_2/project1/body/login/login_page.dart';

class mainpagetast extends StatelessWidget {
  const mainpagetast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Mainpage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
