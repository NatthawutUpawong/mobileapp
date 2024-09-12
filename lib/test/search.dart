// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_2/project1/body/home/Homescreen.dart';
// import 'package:flutter_application_2/project1/body/roomdetail/roomdetil_page.dart';
// import 'package:flutter_application_2/project1/body/searchscreen/searchdetail.dart';
// import 'package:flutter_application_2/project1/data/PicCus.dart';
// import 'package:flutter_application_2/project1/data/Picdetail.dart';

// class SearchH extends StatefulWidget {
//   const SearchH({super.key});

//   @override
//   State<SearchH> createState() => _SearchHState();
// }

// class _SearchHState extends State<SearchH> {
//   // ignore: non_constant_identifier_names
//   List<CusPicdetail> display_list = List.from(cuspicturedetail);

//   // CusPicdetail detail = cuspicturedetail[];

//   // final TextEditingController _searchController = TextEditingController();
//   void updateList(String value) {
//     setState(() {
//       display_list = cuspicturedetail
//           .where((element) =>
//               element.textTitle.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   //ปุ่มย้อนกลับ
//                   flex: 1,
                //   child: IconButton(
                //     onPressed: (() {
                //       setState(() {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: ((context) => Mainpage())));
                //       });
                //     }),
                //     icon: const Icon(
                //       Icons.arrow_back_ios_rounded,
                //       size: 25,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
//                 Expanded(
//                   //ค้นหา
//                   flex: 8,
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       height: 52,
//                       child: TextField(
//                         onChanged: (value) => updateList(value),
//                         decoration: InputDecoration(
//                           hintText: "ที่อยู่หรือพื้นที่ใกล้เคียง....",
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(43.0)),
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ),
//                           suffixIcon: Icon(Icons.search,
//                               color: Color.fromARGB(255, 241, 86, 86)),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(8.0)),
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 241, 86, 86)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               //filter
//               height: 48,
//               decoration: BoxDecoration(),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         //ราคา
//                         child: InkWell(
//                       onTap: (() {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: ((context) => Container(
//                                   height: 300,
//                                   child: Column(
//                                     children: [
//                                       const Spacer(),
//                                       InkWell(
//                                         onTap: null,
//                                         child: Container(
//                                             height: 48,
//                                             padding: const EdgeInsets.all(8),
//                                             child: Row(
//                                               children: const [
//                                                 Text('0 ฿'),
//                                                 Spacer(),
//                                                 Text('1,000 ฿')
//                                               ],
//                                             )),
//                                       ),
//                                       const Spacer(),
//                                       InkWell(
//                                         onTap: null,
//                                         child: Container(
//                                             height: 48,
//                                             padding: const EdgeInsets.all(8),
//                                             child: Row(
//                                               children: const [
//                                                 Text('1,001 ฿'),
//                                                 Spacer(),
//                                                 Text('2,000 ฿')
//                                               ],
//                                             )),
//                                       ),
//                                       const Spacer(),
//                                       InkWell(
//                                         onTap: null,
//                                         child: Container(
//                                             height: 48,
//                                             padding: const EdgeInsets.all(8),
//                                             child: Row(
//                                               children: const [
//                                                 Text('2,001 ฿'),
//                                                 Spacer(),
//                                                 Text('3,000 ฿')
//                                               ],
//                                             )),
//                                       ),
//                                       const Spacer(),
//                                       InkWell(
//                                         onTap: null,
//                                         child: Container(
//                                             height: 48,
//                                             padding: const EdgeInsets.all(8),
//                                             child: Row(
//                                               children: const [
//                                                 Text('more than 3,000 ฿'),
//                                               ],
//                                             )),
//                                       ),
//                                       const Spacer(),
//                                       ElevatedButton(
//                                           onPressed: () {},
//                                           child: const Text('reset')),
//                                       const Spacer()
//                                     ],
//                                   ),
//                                 )));
//                       }),
//                       child: Container(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [Text('ช่วงราคา')],
//                           )),
//                     )),
//                     // Spacer(),
//                     SizedBox(
//                       width: 12,
//                     ),
//                     Expanded(
//                         //เรตติ้ง
//                         child: InkWell(
//                       onTap: (() {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: ((context) => Container(
//                                 height: 300,
//                                 child: Column(
//                                   children: [
//                                     //ช่วงเรตติ้ง
//                                     Row(
//                                       //5 ดาว
//                                       children: [
//                                         InkWell(
//                                           onTap: (null),
//                                           child: Container(
//                                             // color: Colors.red,
//                                             height: 40,
//                                             width: 340,
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 50,
//                                                 ),
//                                                 IconButton(
//                                                   iconSize: 30,
//                                                   icon: Icon(Icons.star),
//                                                   color: Colors.yellow,
//                                                   onPressed: () {},
//                                                 ),
//                                                 SizedBox(width: 10),
//                                                 Text('5 ดาว'),
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       //4 ดาว
//                                       children: [
//                                         InkWell(
//                                           onTap: (null),
//                                           child: Container(
//                                             // color: Colors.red,
//                                             height: 40,
//                                             width: 340,
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 50,
//                                                 ),
//                                                 IconButton(
//                                                   iconSize: 30,
//                                                   icon: Icon(Icons.star),
//                                                   color: Colors.yellow,
//                                                   onPressed: () {},
//                                                 ),
//                                                 SizedBox(width: 10),
//                                                 Text('4 ดาว'),
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       //3 ดาว
//                                       children: [
//                                         InkWell(
//                                           onTap: (null),
//                                           child: Container(
//                                             // color: Colors.red,
//                                             height: 40,
//                                             width: 340,
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 50,
//                                                 ),
//                                                 IconButton(
//                                                   iconSize: 30,
//                                                   icon: Icon(Icons.star),
//                                                   color: Colors.yellow,
//                                                   onPressed: () {},
//                                                 ),
//                                                 SizedBox(width: 10),
//                                                 Text('3 ดาว'),
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       //2 ดาว
//                                       children: [
//                                         InkWell(
//                                           onTap: (null),
//                                           child: Container(
//                                             // color: Colors.red,
//                                             height: 40,
//                                             width: 340,
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 50,
//                                                 ),
//                                                 IconButton(
//                                                   iconSize: 30,
//                                                   icon: Icon(Icons.star),
//                                                   color: Colors.yellow,
//                                                   onPressed: () {},
//                                                 ),
//                                                 SizedBox(width: 10),
//                                                 Text('2 ดาว'),
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       //1 ดาว
//                                       children: [
//                                         InkWell(
//                                           onTap: (null),
//                                           child: Container(
//                                             // color: Colors.red,
//                                             height: 40,
//                                             width: 340,
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 50,
//                                                 ),
//                                                 IconButton(
//                                                   iconSize: 30,
//                                                   icon: Icon(Icons.star),
//                                                   color: Colors.yellow,
//                                                   onPressed: () {},
//                                                 ),
//                                                 SizedBox(width: 10),
//                                                 Text('1 ดาว'),
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                         );
//                       }),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [Text('เรตติ้ง')],
//                         ),
//                       ),
//                     )),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               //แสดงรายการห้อง
//               child: ListView.builder(
//                 itemCount: display_list.length,
//                 itemBuilder: (context, index) {
//                   final detail = cuspicturedetail[index];
//                   return ListTile(
//                     title: Text(
//                       display_list[index].textTitle,
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 241, 86, 86),
//                           fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text('data'),
//                     trailing: Text(
//                       display_list[index].rating,
//                       style: TextStyle(color: Colors.amber[900]),
//                     ),
//                     leading: Image.network(
//                       display_list[index].urlimage,
//                       scale: 6,
//                       fit: BoxFit.cover,
//                       width: 50,
//                       height: 50,
//                     ),
//                     onTap: () => Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Searchdetail())),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
