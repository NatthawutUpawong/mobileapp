// import 'dart:ui';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/project1/body/Profile/profie_pag1.dart';
// import 'package:flutter_application_2/project1/body/login/forgotpass.dart';
// import 'package:flutter_application_2/project1/body/login/register1.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _fromkey = GlobalKey<FormState>();

//   final _tcemail = TextEditingController();
//   final _tcpass = TextEditingController();

//   // Future signIn() async {
//   //   await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //     email: _tcemail.text.trim(),
//   //     password: _tcpass.text.trim(),
//   //   );
//   // }
//   void signIn() async {
//     final email = _tcemail.text.trim();
//     final password = _tcpass.text.trim();

//     if (_fromkey.currentState!.validate()) {
//       try {
//         await FirebaseAuth.instance
//             .signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         )
//             .then((value) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Profilepage(),
//             ),
//           );
//         });
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('No user found for that email.');
//         } else if (e.code == 'wrong-password') {
//           print('Wrong password provided for that user.');
//         }
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _tcemail.dispose();
//     _tcpass.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 23,
//           ),
//           Row(
//             children: [
//               IconButton(
//                 onPressed: (() {
//                   // setState(() {
//                   //   Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(
//                   //           builder: ((context) => Mainpage())));
//                   // });
//                 }),
//                 icon: const Icon(
//                   Icons.arrow_back_ios_rounded,
//                   size: 25,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             height: 400,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Form(
//               key: _fromkey,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 23,
//                     ),
//                     const Text(
//                       'อีเมล',
//                       style: TextStyle(fontSize: 13),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     TextFormField(
//                       controller: _tcemail,
//                       decoration: InputDecoration(
//                         border: const OutlineInputBorder(),
//                         labelText: 'อีเมล',
//                         labelStyle: TextStyle(
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     const Text(
//                       'รหัสผ่าน',
//                       style: TextStyle(fontSize: 13),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     TextFormField(
//                       obscureText: true,
//                       controller: _tcpass,
//                       decoration: InputDecoration(
//                         border: const OutlineInputBorder(),
//                         labelText: 'รหัสผ่าน',
//                         labelStyle: TextStyle(
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter Password';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const Forgotpass(),
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             'ลืมรหัสผ่าน',
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 130,
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const Register(),
//                               ),
//                             );
//                           },
//                           child: const Text('สร้างบัญชี'),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue[300],
//                           ),
//                           onPressed: () {
//                             final isValidForm =
//                                 _fromkey.currentState!.validate();
//                             if (isValidForm) {
//                               signIn();

//                               // clearText();
//                             }
//                           },
//                           // if (_fromkey.currentState!.validate()) {
//                           //   signIn();
//                           //   ScaffoldMessenger.of(context).showSnackBar(
//                           //     const SnackBar(
//                           //       content: Text('เข้าสู่ระบบสำเร็จ'),
//                           //     ),
//                           //   );
//                           //     Navigator.pushReplacement(
//                           //       context,
//                           //       MaterialPageRoute(
//                           //         builder: (context) =>  Profilepage(),
//                           //       ),
//                           //     );
//                           //   }
//                           // },
//                           child: const Text('เข้าสู่ระบบ'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
