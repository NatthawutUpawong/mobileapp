import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/searchscreen/firebasedetails.dart';

class Searchdetail extends StatelessWidget {
  final String itemName;
  final String itemPic;
  final String itemAdress;
  final String itemPhone;
  final double itemPricem;
  final double itemBail;
  final double itemPriced;
  final String itemDetail;
  final String itemId;
  final String itemHostedName;
  final String itemHostedPic;
  const Searchdetail({
    Key? key,
    required this.itemName,
    required this.itemAdress,
    required this.itemBail,
    required this.itemPhone,
    required this.itemPriced,
    required this.itemPricem,
    required this.itemDetail,
    required this.itemPic,
    required this.itemId,
    required this.itemHostedName,
    required this.itemHostedPic,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: dbDetail(
        itemName: itemName,
        itemPricem: itemPricem,
        itemPic: itemPic,
        itemAdress: itemAdress,
        itemPhone: itemPhone,
        itemBail: itemBail,
        itemPriced: itemPriced,
        itemDetail: itemDetail,
        itemId: itemId,
        itemHostedName: itemHostedName,
        itemHostedPic: itemHostedPic,
      ),
    ));
  }
}
