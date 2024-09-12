// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_2/project1/body/home/main_page.dart';
// import '../home/Homescreen.dart';


// class Forrent extends StatefulWidget {
//   const Forrent({super.key});

//   @override
//   State<Forrent> createState() => _ForrentState();
// }

// class _ForrentState extends State<Forrent> {
//   @override
//   Widget build(BuildContext context) {

//     final _fromkey = GlobalKey<FormState>();
//     // text controller
//     final _tcname = TextEditingController();
//     final _tcaddress = TextEditingController();
//     final _tcproince = TextEditingController();
//     final _tcdistrict = TextEditingController();
//     final _tcsubdis = TextEditingController();
//     final _tczipcode = TextEditingController();
//     final _tcphone = TextEditingController();
//     final _tcmail = TextEditingController();
//     final _tctype = TextEditingController();
//     final _tcfloor = TextEditingController();
//     final _tcroom = TextEditingController();

//     // focus node
//     final _focus = FocusNode();
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//               Row(
//                 children: [
//                  IconButton(
//                       onPressed: (() {
//                         setState(() {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: ((context) => Mainpage())));
//                         });
//                       }),
//                       icon: const Icon(
//                         Icons.arrow_back_ios_rounded,
//                         size: 25,
//                         color: Colors.black,
//                       )),
//                 ],
//               ),
//               Form(
//         key: _fromkey,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: ListView(
//             children: <Widget>[
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'ชื่อหอพัก',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcname,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'กรอกชื่อหอพัก',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'ที่อยู่หอพัก',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcaddress,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'บ้านเลขที่/ หมู่/ ซอย/ ถนน',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const Text(
//                 'จังหวัด',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcproince,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'จังหวัด',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const Text(
//                 'อำเภอ',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcdistrict,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'อำเภอ',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const Text(
//                 'ตำบล',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcsubdis,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'ตำบล',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const Text(
//                 'รหัสไปรษณีย์',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tczipcode,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'รหัสไปรษณีย์',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'เบอร์โทรติดต่อหอพัก',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcphone,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'เบอร์โทร',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'อีเมลติดต่อหอพัก',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 autofocus: true,
//                 focusNode: _focus,
//                 controller: _tcmail,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'อีเมล',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'จำนวนชั้น',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcfloor,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'จำนวนชั้น',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'จำนวนห้อง',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcroom,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'จำนวนห้อง',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(),
//                     onPressed: () {
//                       if (_fromkey.currentState!.validate()) {
//                         // print('validated');
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('สร้างหอพักสำเร็จ'),
//                           ),
//                         );
//                       }
//                     },
//                     child: const Text('สร้างหอพัก'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//           ],
//         ),
//       ),
//     );
//   }
// }