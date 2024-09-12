// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/main.dart';
// import 'package:flutter_application_2/project1/body/home/main_profile.dart';
// import 'package:flutter_application_2/project1/data/discount.dart';

// class Promotion extends StatefulWidget {
//   const Promotion({super.key});

//   @override
//   State<Promotion> createState() => _Project1State();
// }

// class _Project1State extends State<Promotion> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 children: [
//                   Container(
//                     height: 70,
//                     decoration: BoxDecoration(
//                         color: mediumColor,
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(45),
//                             bottomRight: Radius.circular(45))),
//                     child: SizedBox(
//                       height: 55,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: Row(
//                                 children: [
//                                   IconButton(
//                                       onPressed: (() {
//                                         setState(() {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: ((context) =>
//                                                       Mainpage3())));
//                                         });
//                                       }),
//                                       icon: const Icon(
//                                         Icons.arrow_back_ios_rounded,
//                                         size: 25,
//                                         color: Colors.white,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               flex: 5,
//                               child: Text(
//                                 'Promotion',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: baseColor,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: coupon.length,
//                       itemBuilder: (context, index) {
//                         final Coupon = coupon[index];
//                         return InkWell(
//                   //         onTap: () => Navigator.pushReplacement(
//                   // context,
//                   // MaterialPageRoute(
//                   //     builder: (context) => )),
//                           child: Container(
//                             height: 100,
//                             // width:,
//                             margin: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(28),
//                                 color: Colors.amber,
//                                 image: DecorationImage(image: AssetImage(Coupon.urlimage))),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
