// import 'package:flutter/material.dart';

// class Project2 extends StatefulWidget {
//   const Project2({Key? key}) : super(key: key);

//   @override
//   _Project2State createState() => _Project2State();
// }

// class _Project2State extends State<Project2> {
//   int _currentIndex = 0;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[300],
//         actions: <Widget>[
//           CircleAvatar(
//             radius: 20,
//             backgroundImage: AssetImage('assets/images/cat.png'),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   width: 50,
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   icon: Icon(Icons.favorite),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 10),
//                 Text('Favorite'),
//               ],
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 50,
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   icon: Icon(Icons.message),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 10),
//                 Text('Message'),
//               ],
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 50,
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   icon: Icon(Icons.money_off),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 10),
//                 Text('Promotion'),
//               ],
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 50,
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   icon: Icon(Icons.notification_add),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 10),
//                 Text('Notification'),
//               ],
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 50,
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   icon: Icon(Icons.room),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 10),
//                 Text('My Room'),
//               ],
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 50,
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   icon: Icon(Icons.logout),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 10),
//                 Text('Log out'),
//               ],
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.white,
//         backgroundColor: Colors.grey,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         //iconSize : 50,
//         // selectedFontSize: 10,
//         // unselectedFontSize: 20,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Colors.grey,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Booking',
//             backgroundColor: Colors.grey,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//             backgroundColor: Colors.grey,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Person',
//             backgroundColor: Colors.grey,
//           ),
//         ],
//         onTap: ((index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         }),
//       ),
//     );
//   }
// }
