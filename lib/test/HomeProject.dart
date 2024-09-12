// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/project1/body/searchscreen/search.dart';
// import 'package:flutter_application_2/project1/data/Picture.dart';
// import 'package:flutter_application_2/project1/data/PicCus.dart';
// import 'package:flutter_application_2/project1/data/discount.dart';

// // import 'searchscreen/search.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   int selectPage = 0;
 
//   List<Widget> _page=[
//     Homepage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
        
//         // bottomNavigationBar: BottomNavigationBar(
//         //   currentIndex: selectPage,
//         //   onTap: ((index) {
//         //     setState(() {
//         //       selectPage =index;
//         //     });
//         //   }),
//         //   items: const [
//         //   BottomNavigationBarItem(
//         //       icon: Icon(
//         //         Icons.home,
//         //         // color: Color.fromARGB(255, 185, 185, 185),
//         //       ),
//         //       label: "Home"),
//         //   BottomNavigationBarItem(
//         //       icon: Icon(
//         //         Icons.book,
//         //         // color: Color.fromARGB(255, 185, 185, 185),
//         //       ),
//         //       label: "Booking"),
//         //   BottomNavigationBarItem(
//         //       icon: Icon(
//         //         Icons.shopping_cart_sharp,
//         //         // color: Color.fromARGB(255, 185, 185, 185),
//         //       ),
//         //       label: "Cart"),
//         //   // BottomNavigationBarItem(
//         //   //     icon: Icon(
//         //   //       Icons.person,
//         //   //       // color: Color.fromARGB(255, 185, 185, 185),
//         //   //     ),
//         //   //     label: "Profile"),
//         // ]),
        
//         body: Column(
//           children: [
           
//             const SizedBox(
//               height: 23,
//             ),
//             SizedBox(
//               height: 55,
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Text(
//                       'Home',
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                   ),
//                   const Expanded(
//                     child: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       //ค้นหากับเปิดให้เช่า
//                       height: 210,
//                       child: ListView.builder(
//                         itemCount: 2,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) =>
//                             buildcontainerfirst(item: item[index]),
//                       ),
//                     ),
//                     Padding(
//                       //recommend
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Recommend',
//                             style: Theme.of(context).textTheme.headlineMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200,
//                       child: ListView.builder(
//                         itemCount: 4,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) =>
//                             buildcontainersecond(cuspicture: cuspicture[index]),
//                       ),
//                     ),
//                     Padding(
//                       //โค้ดส่วนลด
//                       padding: const EdgeInsets.all(10.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'โค้ดส่วนลด',
//                             style: Theme.of(context).textTheme.headlineMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 170,
//                       child: ListView.builder(
//                         itemCount: 3,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) =>
//                             buildcontainerthird(coupon: coupon[index]),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }

//   Widget buildcontainerfirst({
//     required HousePic item,
//   }) =>
//       Container(
//         width: 100,
//         // color: Colors.red,
//         margin: const EdgeInsets.all(40),
//         child: InkWell(
//           onTap: (() => Navigator.push(context,
//               MaterialPageRoute(builder: ((context) => SearchH(item: item))))),
//           child: Column(
//             children: [
//               Image.network(item.urlimage),
//               const SizedBox(height: 4),
//               Text(
//                 item.textDetail,
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           ),
//         ),
//       );
//   Widget buildcontainersecond({
//     required CusPic cuspicture,
//   }) =>
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Expanded(
//                 child: Container(
//               width: 120,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(cuspicture.urlimage))),
//             )),
//             Text(
//               cuspicture.textDetail,
//               style: Theme.of(context).textTheme.titleSmall,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.star,
//                   size: 16,
//                   color: Colors.yellow[700],
//                 ),
//                 const SizedBox(
//                   width: 4,
//                 ),
//                 Text(cuspicture.rating),
//               ],
//             )
//           ],
//         ),
//       );
//   Widget buildcontainerthird({
//     required Discount coupon,
//   }) =>
//       Container(
//         width: 240,
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               fit: BoxFit.contain, image: AssetImage(coupon.urlimage)),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         // child: Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         // child: Row(
//         //   mainAxisAlignment: MainAxisAlignment.start,
//         //   crossAxisAlignment: CrossAxisAlignment.center,
//         //   children: [
//         //     Text('data'),

//         //     SizedBox(width: 20,),
//         //     Text('data'),

//         //   ],
//         // ),
//         // ),
//       );
// }
