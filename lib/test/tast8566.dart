// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../project1/body/home/Homescreen.dart';
// import '../project1/body/searchscreen/searchdetail.dart';

// class Item {
//   final String Cname;
//   final double Cpricem;
//   final String Cpic;
//   final String Cadress;
//   final String Cphone;
//   final String Cdetail;
//   final double Cbail;
//   final double Cpriced;

//   Item(
//       {required this.Cpriced,
//       required this.Cbail,
//       required this.Cname,
//       required this.Cpricem,
//       required this.Cpic,
//       required this.Cdetail,
//       required this.Cadress,
//       required this.Cphone});
// }

// class FilterableListView extends StatefulWidget {
//   @override
//   _FilterableListViewState createState() => _FilterableListViewState();
// }

// class _FilterableListViewState extends State<FilterableListView> {
//   late List<Item> _itemList;
//   late List<Item> _filteredItemList;
//   late TextEditingController _searchController;

//   @override
//   void initState() {
//     super.initState();
//     _itemList = [];
//     _filteredItemList = [];
//     _searchController = TextEditingController();
//     _loadData();
//   }

//   void _loadData() async {
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection('cusdetail').get();

//     List<Item> itemList = [];

//     querySnapshot.docs.forEach((doc) {
//       Item item = Item(
//         Cname: doc['Name'],
//         Cpricem: double.parse(doc['pricem']),
//         Cpic: doc['pic1'],
//         Cadress:
//             '${doc['house_number']}${doc['Subdistrict']}, ${doc['district']}, ${doc['province']}, ${doc['zip_code']}',
//         Cphone: doc['phone_number'],
//         Cbail: double.parse(doc['bail']),
//         Cpriced: double.parse(doc['price']),
//         Cdetail: doc['details'],
//       );
//       itemList.add(item);
//     });

//     setState(() {
//       _itemList = itemList;
//       _filteredItemList = itemList;
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _filterItemList(double minPrice, double maxPrice) {
//     setState(() {
//       _filteredItemList = _itemList
//           .where((item) => item.Cpricem >= minPrice && item.Cpricem <= maxPrice)
//           .toList();
//     });
//   }

//   void _searchItemList(String searchTerm) {
//     setState(() {
//       _filteredItemList = _itemList
//           .where((item) =>
//               item.Cname.toLowerCase().contains(searchTerm.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 0,
//                     child: IconButton(
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
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex:5,
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         hintText: 'Search...',
//                       ),
//                       onChanged: (value) {
//                         _searchItemList(value);
//                       },
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           double minPrice = 0;
//                           double maxPrice = 0;
//                           return AlertDialog(
//                             title: Text('Filter by Price'),
//                             content: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 TextField(
//                                   decoration: InputDecoration(
//                                     labelText: 'Minimum Price',
//                                   ),
//                                   keyboardType: TextInputType.number,
//                                   onChanged: (value) {
//                                     minPrice = double.tryParse(value) ?? 0;
//                                   },
//                                 ),
//                                 TextField(
//                                   decoration: InputDecoration(
//                                     labelText: 'Maximum Price',
//                                   ),
//                                   keyboardType: TextInputType.number,
//                                   onChanged: (value) {
//                                     maxPrice = double.tryParse(value) ?? 0;
//                                   },
//                                 ),
//                               ],
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('Cancel'),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   _filterItemList(minPrice, maxPrice);
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('Apply'),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: Text('ช่วงราคา'),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _filteredItemList.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_filteredItemList[index].Cname),
//                     subtitle:
//                         Text('Price: ${_filteredItemList[index].Cpricem}'),
//                     leading: Image.network(
//                       _filteredItemList[index].Cpic,
//                       scale: 6,
//                       fit: BoxFit.cover,
//                       width: 50,
//                       height: 50,
//                     ),
//                     onTap: () => Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Searchdetail(
//                               itemName:_filteredItemList[index].Cname,
//                               itemPricem:_filteredItemList[index].Cpricem,
//                               itemPic:_filteredItemList[index].Cpic,
//                               itemAdress:_filteredItemList[index].Cadress,
//                               itemPhone:_filteredItemList[index].Cphone,
//                               itemBail:_filteredItemList[index].Cbail,
//                               itemPriced:_filteredItemList[index].Cpriced,
//                               itemDetail:_filteredItemList[index].Cdetail,

//                             ))),
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
