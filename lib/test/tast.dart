import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});
}

class SearchAndFilterDemo extends StatefulWidget {
  const SearchAndFilterDemo({Key? key}) : super(key: key);

  @override
  _SearchAndFilterDemoState createState() => _SearchAndFilterDemoState();
}

class _SearchAndFilterDemoState extends State<SearchAndFilterDemo> {

final _userStream =
      FirebaseFirestore.instance.collection('cusdetail').snapshots();

  final List<Item> _items = [
    Item(name: 'Item 1', price: 500),
    Item(name: 'Item 2', price: 1500),
    Item(name: 'Item 3', price: 2500),
    Item(name: 'Item 4', price: 750),
    Item(name: 'Item 5', price: 1250),
    Item(name: 'Item 6', price: 1750),
  ];

  String _searchQuery = '';
  double _priceFilter = 0;

  void _onSearchQueryChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _onPriceFilter(double value) {}

  List<Item> _getFilteredItems() {
    return _items.where((item) {
      final nameMatches =
          item.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final priceMatches = item.price >= _priceFilter;
      return nameMatches && priceMatches;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search and Filter Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: _showPriceFilterDialog,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TextField(
            onChanged: _onSearchQueryChanged,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _getFilteredItems().length,
        itemBuilder: (context, index) {
          final item = _getFilteredItems()[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\$${item.price}'),
          );
        },
      ),
    );
  }

  void _showPriceFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter by Price'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StatefulBuilder(builder: ((context, state) {
                return Column(
                  children: [
                    Slider(
                        value: _priceFilter,
                        min: 0,
                        max: 3000,
                        divisions: 6,
                        label: '\$${_priceFilter.toStringAsFixed(0)}',
                        onChanged: ((double value) {
                          state(() {});
                          setState(() {
                            _priceFilter = value;
                          });
                        })),
                    Text('Minimum price: \$${_priceFilter.toStringAsFixed(0)}'),
                    SizedBox(height: 16),
                  ],
                );
              }))
            ],
          ),
          actions: [
            TextButton(
              child: Text('CLEAR'),
              onPressed: () {
                setState(() {
                  _priceFilter = 0;
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('APPLY'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
