import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/tastlogin/main_page.dart';

const Color primaryColor = Color(0xFFFFBD73);
const Color baseColor = Color(0xFFf8f9fb);
const Color mediumColor = Colors.white;
Color iconColor = Colors.grey.shade900;
const Color iconunselect = Colors.grey;

const Color iColor = Color(0xFFffffff);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: mainpagetast(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: baseColor,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF1d3c4a),
            fontWeight: FontWeight.w500,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.black,
            shape: const StadiumBorder(side: BorderSide.none),
            padding: const EdgeInsets.all(11),
          ),
        ),
      ),
    ),
  );
}
