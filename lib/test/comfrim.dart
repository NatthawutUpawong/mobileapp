// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/main.dart';
// import 'package:flutter_application_2/project1/body/fav/payment.dart';
// import 'package:flutter_application_2/project1/body/home/main_fav.dart';


// class Comfrimpage extends StatefulWidget {
//   const Comfrimpage({super.key});

//   @override
//   State<Comfrimpage> createState() => _ComfrimState();
// }

// class _ComfrimState extends State<Comfrimpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.grey[200],
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 70,
//               decoration: BoxDecoration(
//                 color: mediumColor,
//               ),
//               child: SizedBox(
//                 height: 55,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       IconButton(
//                           onPressed: (() {
//                             setState(() {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: ((context) => Mainfav())));
//                             });
//                           }),
//                           icon: const Icon(
//                             Icons.arrow_back_ios_rounded,
//                             size: 25,
//                             color: Colors.white,
//                           )),
//                       const Text(
//                         'BOOKING COMFRIM',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: baseColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//               //color: Colors.white,
//               height: 50,
//               child: Row(
//                 children: [
//                   //SizedBox(
//                   // width: 50,
//                   // ),
//                   IconButton(
//                     iconSize: 20,
//                     icon: Icon(Icons.person),
//                     onPressed: () {},
//                   ),
//                   SizedBox(width: 10),
//                   Text('Rabella Weston \n+08x xxx xxxx\nxx@gmail.com'),
//                   const Spacer(),
//                   IconButton(
//                       onPressed: (() {
//                         setState(() {});
//                       }),
//                       icon: const Icon(
//                         Icons.arrow_forward_ios_sharp,
//                         size: 20,
//                         color: Colors.black,
//                       )),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//               width: 250,
//               height: 150,
//               decoration: BoxDecoration(
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/a9/7f/74/4-bed-bedroom-with-bathroom.jpg?w=1200&h=-1&s=1'),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             const Text(
//               'Harry Dorm',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//               height: 50,
//               //color: Colors.grey,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     'โค้ดส่วนลด',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   ElevatedButton(
//                       onPressed: () {}, child: Text('เลือกโค้ดส่วนลด')),
//                   SizedBox(
//                     width: 20,
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: 20,
//               child: Column(
//                 children: [
//                   Row(
//                     children: const [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         'Payment',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: 20,
//               width: 300,
//               child: Column(
//                 children: [
//                   Row(
//                     children: const [
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Text('ค่าเช่า'),
//                       const Spacer(),
//                       Text('฿ 2,000'),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: 20,
//               width: 300,
//               child: Column(
//                 children: [
//                   Row(
//                     children: const [
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Text('ค่าประกัน'),
//                       const Spacer(),
//                       Text('฿ 500'),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: 20,
//               width: 300,
//               child: Column(
//                 children: [
//                   Row(
//                     children: const [
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Text('ส่วนลด'),
//                       const Spacer(),
//                       Text('฿ 0'),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: 20,
//               width: 300,
//               child: Column(
//                 children: [
//                   Row(
//                     children: const [
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Text(
//                         'Total',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const Spacer(),
//                       Text(
//                         '฿ 2,500',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: 50,
//               //color: Colors.grey,
//               child: Row(
//                 children: [
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   const Spacer(),
//                   ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PaymentPage(),
//                           ),
//                         );
//                       },
//                       child: const Text('ชำระเงิน')),
//                   const SizedBox(
//                     width: 20,
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
