// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/main.dart';
// import 'package:flutter_application_2/project1/body/home/main_profile.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   bool isObscurePassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mediumColor,
//         title: Text('Flutter Edit Profile UI'),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: ((context) => Mainpage3())));
//           },
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.settings),
//             color: Colors.white,
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 15, top: 20, right: 15),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 4, color: Colors.white),
//                         boxShadow: [
//                           BoxShadow(
//                               spreadRadius: 2,
//                               blurRadius: 10,
//                               color: Colors.black.withOpacity(0.1))
//                         ],
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/cat.png'),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 30,
//                         width: 30,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(width: 4, color: Colors.white),
//                             color: Colors.grey),
//                         child: Icon(
//                           Icons.edit,
//                           color: Colors.white,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               buildTextField("Full Name", "Monesy Niko", false),
//               buildTextField("Password", "********", true),
//               buildTextField("Email", "6431501***@lamduan.mfu.ac.th", false),
//               buildTextField("Location", "111/1 Tasud Chaingrai", false),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlinedButton(
//                     onPressed: () {},
//                     child: Text(
//                       "CANCEL",
//                       style: TextStyle(
//                           fontSize: 15, letterSpacing: 2, color: Colors.black),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text(
//                       "SAVE",
//                       style: TextStyle(
//                         fontSize: 15,
//                         letterSpacing: 2,
//                         color: Colors.black,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(
//       String label, String placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 30),
//       child: TextField(
//         obscureText: isPasswordTextField ? isObscurePassword : false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField
//                 ? IconButton(
//                     icon: Icon(
//                       Icons.remove_red_eye,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isObscurePassword = !isObscurePassword;
//                       });
//                     },
//                   )
//                 : null,
//             contentPadding: EdgeInsets.only(bottom: 5),
//             labelText: label,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder,
//             hintStyle: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
//       ),
//     );
//   }
// }
