// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/main.dart';




// class Cartpage extends StatelessWidget {
//   const Cartpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   title: const Text('CART'),
//       //   backgroundColor: const Color.fromARGB(255, 7, 87, 49),
//       // ),
//       // backgroundColor: Colors.grey[300],
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 23,
//           ),
//           Container(
//             height: 70,
//             decoration: BoxDecoration(
//               color: mediumColor,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(45),
//                 bottomRight: Radius.circular(45)
//               )
//             ),
//             child: SizedBox(
//               height: 55,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                         'CART',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: baseColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           //1
//           const Spacer(),
//           Container(
//             height: 120,
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 150,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(
//                       image: NetworkImage(
//                           'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/a9/7f/74/4-bed-bedroom-with-bathroom.jpg?w=1200&h=-1&s=1'),
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   children: const [
//                     Text(
//                       'DORM: 1',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('details'),
//                     Spacer(),
//                     Text(
//                       'price: xxxx',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Column(
//                   children: [
//                     TextButton(
//                         onPressed: () {},
//                         child: const Icon(Icons.delete, color: Colors.red)),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => const payment(),
//                         //   ),
//                         // );
//                       },
//                       child: const Text(
//                         'NEXT',
//                         style: TextStyle(color: Color.fromARGB(255, 7, 87, 49)),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.yellow),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           //2
//           const Spacer(),
//           Container(
//             height: 120,
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 150,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(
//                       image: NetworkImage(
//                           'https://images.trvl-media.com/lodging/10000000/9860000/9853700/9853642/04c8ad50.jpg?impolicy=resizecrop&rw=500&ra=fit'),
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   children: const [
//                     Text(
//                       'DORM: 2',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('details'),
//                     Spacer(),
//                     Text(
//                       'price: xxxx',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Column(
//                   children: [
//                     TextButton(
//                         onPressed: () {},
//                         child: const Icon(Icons.delete, color: Colors.red)),
//                     ElevatedButton(
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => const payment(),
//                           //   ),
//                           // );
//                         },
//                         child: const Text('NEXT',
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 7, 87, 49))),
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.yellow))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           //3
//           const Spacer(),
//           Container(
//             height: 120,
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 150,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVMDUupZlHwKTZhMS2xLbmVNaP06mDnHEXTw&usqp=CAU'),
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   children: const [
//                     Text(
//                       'DORM: 3',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('details'),
//                     Spacer(),
//                     Text(
//                       'price: xxxx',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Column(
//                   children: [
//                     TextButton(
//                         onPressed: () {},
//                         child: const Icon(Icons.delete, color: Colors.red)),
//                     ElevatedButton(
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => const payment(),
//                           //   ),
//                           // );
//                         },
//                         child: const Text('NEXT',
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 7, 87, 49))),
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.yellow))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           //4
//           const Spacer(),
//           Container(
//             height: 120,
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 150,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG1ds13fD8q8ykZA7M9Yh4huIJcQWuA52Mog&usqp=CAU'),
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   children: const [
//                     Text(
//                       'DORM: 4',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('details'),
//                     Spacer(),
//                     Text(
//                       'price: xxxx',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Column(
//                   children: [
//                     TextButton(
//                         onPressed: () {},
//                         child: const Icon(Icons.delete, color: Colors.red)),
//                     ElevatedButton(
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => const payment(),
//                           //   ),
//                           // );
//                         },
//                         child: const Text('NEXT',
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 7, 87, 49))),
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.yellow))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
     
//     );
//   }
// }