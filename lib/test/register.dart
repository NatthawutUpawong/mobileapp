// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'login_page.dart';

// class Register extends StatelessWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _fromkey = GlobalKey<FormState>();
//     // text controller
//     final _tcname = TextEditingController();
//     final _tcsurname = TextEditingController();
//     final _tcage = TextEditingController();
//     final _tcUsername = TextEditingController();
//     final _tcpass = TextEditingController();
//     final _tcpassagin = TextEditingController();

//     // focus node
//     final _focus = FocusNode();

//     @override
//     // void dispose() {
//     //   _tcname.dispose();
//     //   _tcsurname.dispose();
//     //   _tcage.dispose();
//     //   _tcUsername.dispose();
//     //   _tcpass.dispose();
//     //   _tcpassagin.dispose();
//     // }

//     Future signUp() async {
//       // final uid = FirebaseAuth.instance.currentUser!.uid;
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _tcUsername.text.trim(), password: _tcpass.text.trim())
//           .then((value) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc(value.user?.uid)
//             .set({
//           'name': _tcname.text,
//           'surname': _tcsurname.text,
//           'age': _tcage.text,
//           'email': _tcUsername.text,
//           'uid': value.user?.uid
//         });
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => LoginPage()));
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         title: const Center(
//           child: Text(
//             'สมัครสมาชิก',
//             style: TextStyle(color: Colors.black),
//           ),
//         ),
//       ),
//       body: Form(
//         key: _fromkey,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: ListView(
//             children: <Widget>[
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'ชื่อ',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcname,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   labelText: 'ชื่อ',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'นามสกุล',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcsurname,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   labelText: 'นามสกุล',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'อายุ',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcage,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   labelText: 'อายุ',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter age';
//                   } else if (int.tryParse(value) == null) {
//                     return 'Please input only integer';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'อีเมล',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 autofocus: true,
//                 focusNode: _focus,
//                 controller: _tcUsername,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   labelText: 'อีเมล',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'รหัสผ่าน',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcpass,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   labelText: 'รหัสผ่าน',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Text(
//                 'ยืนยันรหัสผ่าน',
//                 style: TextStyle(fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: _tcpassagin,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   labelText: 'ยืนยันรหัสผ่าน',
//                   labelStyle: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter password';
//                   } else if (value != _tcpass.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue[300]),
//                     onPressed: () {
//                       if (_fromkey.currentState!.validate()) {
//                         signUp();
//                         // print('validated');
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('สมัครสมาชิกสำเร็จ'),
//                           ),
//                         );
//                       }
//                     },
//                     child: const Text('สมัครสมาชิก'),
//                   ),
//                   const SizedBox(
//                     width: 140,
//                   ),
//                   ElevatedButton(
//                     style:
//                         ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                     onPressed: () {
//                       // reset from
//                       _fromkey.currentState!.reset();
//                       // focus to ter frist from
//                       _focus.requestFocus();
//                     },
//                     child: const Text('รีเซ็ต'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
