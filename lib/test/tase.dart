// // CRUD: create, read, update, delete

// import 'package:flutter/material.dart';

// class CrudDemo extends StatefulWidget {
//   const CrudDemo({super.key});

//   @override
//   State<CrudDemo> createState() => _CrudDemoState();
// }

// class _CrudDemoState extends State<CrudDemo> {
//   // data will be from db
//   final List users = [
//     {'name': 'Logan', 'age': 45},
//     {'name': 'Laura', 'age': 14},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CRUD demo'),
//       ),
//       body: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: ((context, index) {
//           return ListTile(
//             title: Text(users[index]['name']),
//             subtitle: Text(users[index]['age'].toString()),
//           );
//         }),
//       ),
//     );
//   }
// }