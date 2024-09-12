import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/searchscreen/searchdetail.dart';
import '../home/Homescreen.dart';

class Item {
  final String Cname;
  final double Cpricem;
  final String Cpic;
  final String Cadress;
  final String Cphone;
  final String Cdetail;
  final double Cbail;
  final double Cpriced;
  final String Cid;
  final String hostedName;
  final String hostedPic;

  Item({
    required this.Cpriced,
    required this.Cbail,
    required this.Cname,
    required this.Cpricem,
    required this.Cpic,
    required this.Cdetail,
    required this.Cadress,
    required this.Cphone,
    required this.Cid,
    required this.hostedName,
    required this.hostedPic,
  });
}

class FilterableListView extends StatefulWidget {
  @override
  _FilterableListViewState createState() => _FilterableListViewState();
}

class _FilterableListViewState extends State<FilterableListView> {
  late List<Item> _itemList;
  late List<Item> _filteredItemList;
  late TextEditingController _searchController;
  late double _minPrice = 0;
  late double _maxPrice = 20000;
  late RangeValues _currentRangeValues;
  String _filterText = '';
  @override
  void initState() {
    super.initState();
    _itemList = [];
    _filteredItemList = [];
    _searchController = TextEditingController();
    _currentRangeValues = RangeValues(_minPrice, _maxPrice);

    _loadData();
  }

  void _loadData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('room').get();

    List<Item> itemList = [];

    querySnapshot.docs.forEach((doc) {
      Item item = Item(
        Cname: doc['Name'],
        Cpricem: double.parse(doc['pricem']),
        Cpic: doc['pic1'],
        Cadress:
            '${doc['house_number']}${doc['Subdistrict']}, ${doc['district']}, ${doc['province']}, ${doc['zip_code']}',
        Cphone: doc['phone_number'],
        Cbail: double.parse(doc['bail']),
        Cpriced: double.parse(doc['price']),
        Cdetail: doc['details'],
        Cid: doc['uid'],
        hostedName: doc['hostedName'],
        hostedPic: doc['hostedPic'],
      );
      itemList.add(item);
    });

    setState(() {
      _itemList = itemList;
      _filteredItemList = itemList;
    });
  }

  @override
  void _filterList() {
    setState(() {
      _filterText = _searchController.text.toLowerCase();
      _filteredItemList = _itemList
          .where((item) =>
              item.Cname.toLowerCase().contains(_filterText) &&
              item.Cpricem >= _currentRangeValues.start &&
              item.Cpricem <= _currentRangeValues.end)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      onPressed: (() {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Mainpage())));
                        });
                      }),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                      ),
                      onChanged: (value) {
                        _filterList();
                      },
                    ),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: (() {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    StatefulBuilder(builder: ((context, state) {
                                      return Column(
                                        children: [
                                          Text('กำหนดช่วงราคา'),
                                          RangeSlider(
                                              values: _currentRangeValues,
                                              min: _minPrice,
                                              max: _maxPrice,
                                              divisions: 20,
                                              labels: RangeLabels(
                                                _currentRangeValues.start
                                                    .round()
                                                    .toString(),
                                                _currentRangeValues.end
                                                    .round()
                                                    .toString(),
                                              ),
                                              onChanged: (((value) {
                                                state(
                                                  () {},
                                                );
                                                setState(() {
                                                  _currentRangeValues = value;
                                                });
                                                _filterList();
                                              }))),
                                          Text(
                                              '${_currentRangeValues.start.round().toString()} ถึง ${_currentRangeValues.end.round().toString()}'),
                                          SizedBox(height: 16),
                                        ],
                                      );
                                    }))
                                  ],
                                ),
                              );
                            });
                      }),
                      child: Text(
                        'กรอง',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 2.5,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItemList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(_filteredItemList[index].Cname),
                        subtitle:
                            Text('Price: ${_filteredItemList[index].Cpricem}'),
                        leading: Image.network(
                          _filteredItemList[index].Cpic,
                          scale: 6,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Searchdetail(
                                      itemName: _filteredItemList[index].Cname,
                                      itemPricem:
                                          _filteredItemList[index].Cpricem,
                                      itemPic: _filteredItemList[index].Cpic,
                                      itemAdress:
                                          _filteredItemList[index].Cadress,
                                      itemPhone:
                                          _filteredItemList[index].Cphone,
                                      itemBail: _filteredItemList[index].Cbail,
                                      itemPriced:
                                          _filteredItemList[index].Cpriced,
                                      itemDetail:
                                          _filteredItemList[index].Cdetail,
                                      itemId: _filteredItemList[index].Cid,
                                      itemHostedName:
                                          _filteredItemList[index].hostedName,
                                      itemHostedPic:
                                          _filteredItemList[index].hostedPic,
                                    ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 2.5,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
