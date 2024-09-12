import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/test/cart_page.dart';

class Bookpage extends StatelessWidget {
  const Bookpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //1
          const SizedBox(
            height: 23,
          ),
          Container(
            height: 70,
            decoration: const BoxDecoration(
                color: mediumColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45))),
            child: SizedBox(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'MY ROOM',
                      style: TextStyle(
                        fontSize: 16,
                        color: baseColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/a9/7f/74/4-bed-bedroom-with-bathroom.jpg?w=1200&h=-1&s=1'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Harry Dorm',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 1,
            color: mediumColor,
          ),
          Container(
            height: 30,
            child: Row(
              children: const [
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  Icons.room_preferences,
                  color: mediumColor,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ROOM: 108',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //TextButton(onPressed: , child: Text('ติดต่อเจ้าของ'))
              ],
            ),
          ),
          Container(
            height: 1,
            color: mediumColor,
          ),
          Container(
            height: 80,
            child: Row(
              children: const [
                Padding(padding: EdgeInsets.only(left: 40)),
                Text(
                  '- เตียงเดี่ยว 2 ชั้น \n- ห้องแอร์\n -เลี้ยงสัตว์ได้',
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: mediumColor,
          ),
          Container(
            height: 30,
            child: Row(
              children: const [
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  Icons.money_off,
                  color: mediumColor,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ค่าใช้จ่ายประจำเดือน',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: mediumColor,
          ),
          Container(
            height: 20,
            width: 300,
            child: Row(
              children: const [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text('- ค่าเช่าห้อง'),
                const Spacer(),
                Text('฿ 2,000')
              ],
            ),
          ),
          Container(
            height: 20,
            width: 300,
            child: Row(
              children: const [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text('- ค่าไฟ'),
                const Spacer(),
                Text('฿ 300')
              ],
            ),
          ),
          SizedBox(
            height: 20,
            width: 300,
            child: Row(
              children: const [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text('- ค่าน้ำ'),
                const Spacer(),
                Text('฿ 80')
              ],
            ),
          ),
          Container(
            height: 1,
            color: mediumColor,
          ),
          Expanded(
            child: Container(
              height: 20,
              width: 300,
              child: Row(
                children: const [
                  //Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    'TOTAL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '฿ 2,380',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
