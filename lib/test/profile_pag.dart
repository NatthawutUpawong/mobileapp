// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/project1/body/Profile/EditProfile.dart';
// import 'package:flutter_application_2/project1/body/home/main_booking.dart';
// import 'package:flutter_application_2/project1/body/home/main_fav.dart';
// import 'package:flutter_application_2/project1/body/login/login_page.dart';
// import 'package:flutter_application_2/main.dart';

// class Profilepage extends StatefulWidget {
//   const Profilepage({super.key});

//   @override
//   State<Profilepage> createState() => _ProfilepageState();
// }

// class _ProfilepageState extends State<Profilepage> {
//   @override
//   Widget build(BuildContext context) {
//     String? name;
//     String? email;
//     String? surname;

//     // get user info
//     // FirebaseFirestore.instance
//     //     .collection('users')
//     //     .doc(FirebaseAuth.instance.currentUser!.uid)
//     //     .get()
//     //     .then((value) async {
//     //   if (value.exists) {
//     //     setState(() {
//     //       email = value.data()!["Email"];
//     //       name = value.data()!["FullName"];
//     //       surname = value.data()!["SurName"];
//     //       // phone = value.data()!["Phone"];
//     //       // school = value.data()!["school"];
//     //       // studentid = value.data()!["studentId"];
//     //       // profileurl = value.data()!["ProfileImageUrl"];
//     //     });
//     //   }
//     // });

//     // @override
//     // void initState() {
//     //   getData();
//     //   super.initState();
//     // }

//     return SafeArea(
//       child: Scaffold(
//         body: Column(children: [
//           Container(
//             height: 70,
//             decoration: BoxDecoration(
//                 color: mediumColor,
//                 // color: Colors.amber,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(45),
//                     bottomRight: Radius.circular(45))),
//             child: SizedBox(
//               height: 55,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 5,
//                       child: Text(
//                         'PROFILE',
//                         style: TextStyle(
//                           fontSize: 16,
//                           // color: baseColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const Expanded(
//                       child: CircleAvatar(
//                         backgroundImage: AssetImage('assets/images/cat.png'),
//                         // backgroundColor: Colors.black,
//                         radius: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text('Email: $email'),
//               Text('Name: $name'),
//               Text('Surname: $surname'),
//               // Text('School: $schoo\l'),
//               Row(
//                 //Favorite
//                 children: [
//                   InkWell(
//                     onTap: (() => Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => Mainfav()))),
//                     child: Container(
//                       // color: Colors.red,
//                       height: 40,
//                       width: 340,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 50,
//                           ),
//                           IconButton(
//                             iconSize: 30,
//                             icon: Icon(Icons.favorite),
//                             onPressed: () {},
//                           ),
//                           SizedBox(width: 10),
//                           Text('Favorite'),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 //Notification
//                 children: [
//                   InkWell(
//                     onTap: (() => Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => EditProfile()))),
//                     child: Container(
//                       // color: Colors.red,
//                       height: 40,
//                       width: 340,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 50,
//                           ),
//                           IconButton(
//                             iconSize: 30,
//                             icon: Icon(Icons.edit_outlined),
//                             onPressed: () {},
//                           ),
//                           SizedBox(width: 10),
//                           Text('Editprofile'),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 //My Room
//                 children: [
//                   InkWell(
//                     onTap: (() => Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => Mainbook()))),
//                     child: Container(
//                       // color: Colors.red,
//                       height: 40,
//                       width: 340,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 50,
//                           ),
//                           IconButton(
//                             iconSize: 30,
//                             icon: Icon(Icons.room),
//                             onPressed: () {},
//                           ),
//                           SizedBox(width: 10),
//                           Text('My Room'),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   InkWell(
//                     //Log out
//                     onTap: (() => Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: ((context) => const LoginPage())))),
//                     child: Container(
//                       // color: Colors.red,
//                       height: 40,
//                       width: 340,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 50,
//                           ),
//                           IconButton(
//                             iconSize: 30,
//                             icon: Icon(Icons.logout),
//                             onPressed: () {
//                               FirebaseAuth.instance.signOut();
//                             },
//                           ),
//                           SizedBox(width: 10),
//                           Text('Log out'),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }
