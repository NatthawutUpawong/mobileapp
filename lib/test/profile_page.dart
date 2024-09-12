// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/project1/body/Profile/EditProfile.dart';
// import 'package:flutter_application_2/project1/body/Profile/chat.dart';
// import 'package:flutter_application_2/project1/body/booking/book_page.dart';
// import 'package:flutter_application_2/project1/body/home/main_booking.dart';
// import 'package:flutter_application_2/project1/body/home/main_fav.dart';
// import 'package:flutter_application_2/project1/body/login/login_page.dart';
// import 'package:flutter_application_2/main.dart';
// import 'package:flutter_application_2/project1/body/promotion/promotion.dart';

// class Profilepage extends StatelessWidget {
//   const Profilepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(
//         //   backgroundColor: Colors.grey[300],
//         //   actions: <Widget>[
//         //     CircleAvatar(
//         //       radius: 20,
//         //       // backgroundImage: AssetImage('assets/images/cat.png'),
//         //     ),
//         //   ],
//         // ),
//         body: Column(children: [
//           Container(
//             height: 70,
//             decoration: BoxDecoration(
//                 color: mediumColor,
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
//                           color: baseColor,
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
//               // Row(
//               //   //Promotion
//               //   children: [
//               //     InkWell(
//               //       onTap: (() => Navigator.pushReplacement(
//               //           context,
//               //           MaterialPageRoute(
//               //               builder: (context) => Promotion()))),
//               //       child: Container(
//               //         // color: Colors.red,
//               //         height: 40,
//               //         width: 340,
//               //         child: Row(
//               //           children: [
//               //             SizedBox(
//               //               width: 50,
//               //             ),
//               //             IconButton(
//               //               iconSize: 30,
//               //               icon: Icon(Icons.money_off),
//               //               onPressed: () {},
//               //             ),
//               //             SizedBox(width: 10),
//               //             Text('Promotion'),
//               //           ],
//               //         ),
//               //       ),
//               //     )
//               //   ],
//               // ),
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
