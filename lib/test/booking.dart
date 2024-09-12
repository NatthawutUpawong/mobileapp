// import 'package:flutter/material.dart';
// import 'cart.dart';

// class booking extends StatelessWidget {
//   const booking({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('BOOKINGS'),
//         backgroundColor: const Color.fromARGB(255, 7, 87, 49),
//       ),
//       backgroundColor: Colors.grey[300],
//       body: Column(
//         children: [
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
//                           'https://st2.depositphotos.com/1004771/9936/i/600/depositphotos_99369142-stock-photo-clean-hostel-room.jpg'),
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
//                     Text('details')
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
//                       'DORM: 2',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('details'),
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
//                       'DORM: 3',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('details')
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
//                       'DORM: 4',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('details')
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         height: 60,
//         color: const Color.fromARGB(255, 7, 87, 49),
//         padding: const EdgeInsets.only(bottom: 10),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Spacer(),
//             TextButton(
//                 onPressed: () {},
//                 child: const Icon(Icons.home, color: Colors.white)),
//             const Spacer(),
//             TextButton(
//                 onPressed: () {},
//                 child: const Icon(
//                   Icons.book,
//                   color: Colors.white,
//                 )),
//             const Spacer(),
//             TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const cart(),
//                     ),
//                   );
//                 },
//                 child: const Icon(Icons.shopping_cart, color: Colors.white)),
//             const Spacer(),
//             TextButton(
//                 onPressed: () {},
//                 child: const Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 )),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
