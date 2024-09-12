import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/roomdetail/body_detail.dart';
import 'package:flutter_application_2/project1/data/PicCus.dart';

class DetailsPage extends StatelessWidget {
  final CusPic cuspicture;
  const DetailsPage({super.key, required this.cuspicture, });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Body_room(cuspicture),
    )
    );
  }
}