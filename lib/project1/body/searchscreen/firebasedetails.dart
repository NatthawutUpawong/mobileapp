import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/home/main_booking.dart';
import 'package:flutter_application_2/project1/body/searchscreen/search1.dart';
import '../../../main.dart';

class dbDetail extends StatefulWidget {
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

  final user = FirebaseAuth.instance.currentUser!;

  dbDetail({
    Key? key,
    required this.itemName,
    required this.itemDetail,
    required this.itemAdress,
    required this.itemBail,
    required this.itemPhone,
    required this.itemPriced,
    required this.itemPricem,
    required this.itemPic,
    required this.itemId,
    required this.itemHostedName,
    required this.itemHostedPic,
  }) : super(key: key);

  @override
  State<dbDetail> createState() => _dbDetailState();
}

class _dbDetailState extends State<dbDetail> {
  String? name = '';
  String? email = '';
  String? surname = '';
  String? image =
      'https://t3.ftcdn.net/jpg/03/88/40/56/360_F_388405670_0CyoZYAqHUGJkwxWxq6FquVGjEv4UJ5K.jpg';
  String? phone = '';
  double? rating = 0;

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = '${snapshot.data()!["name"]} ${snapshot.data()!["surname"]}';
          image = snapshot.data()!["imageurl"];
          phone = snapshot.data()!["phone"];
          email = snapshot.data()!['email'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: size.height * 0.4,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.4 - 50,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.itemPic))),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: size.width * 0.9,
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 50,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          widget.itemName,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: (() {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        FilterableListView())));
                          });
                        }),
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 25,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '฿${widget.itemPricem}/',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text('Month')
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '฿${widget.itemPriced}/',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text('Night')
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Bail',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      ' ฿${widget.itemBail}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2.5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.room_outlined),
                  ],
                ),
                Text(widget.itemAdress),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Icon(Icons.perm_device_information),
                  Text(
                    'Detail',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ]),
                Text(widget.itemDetail),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.how_to_reg_sharp),
                    Text(
                      'Hosted by',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Text('Name ${widget.itemHostedName}'),
                  leading: SizedBox(
                      height: 60,
                      width: 60,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          widget.itemHostedPic,
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(5),
                      )),
                  subtitle: Text('Phone ${widget.itemPhone}'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(280, 44),
                            backgroundColor: Colors.blue),
                        onPressed: (() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(child: Text('CONFIRM')),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red),
                                          child: Text('CANCEL'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.blue),
                                              child: Text('OK'),
                                              onPressed: () {
                                                setState(() {
                                                  Map<String, dynamic> data = {
                                                    "Name": widget.itemName,
                                                    "Adress": widget.itemAdress,
                                                    "phone_number":
                                                        widget.itemPhone,
                                                    "price": widget.itemPriced,
                                                    "pricem": widget.itemPricem,
                                                    "bail": widget.itemBail,
                                                    "details":
                                                        widget.itemDetail,
                                                    "pic1": widget.itemPic,
                                                    "roomOwnerId":
                                                        widget.itemId,
                                                    "hostedName":
                                                        widget.itemHostedName,
                                                    "hostedPic":
                                                        widget.itemHostedPic,
                                                    'CusName':
                                                        '${name} ${surname}',
                                                    'Cusimage': image,
                                                    'Cusemail': email,
                                                    'Cusphone': phone,
                                                    'CusId': uid,
                                                  };
                                                  FirebaseFirestore.instance
                                                      .collection("booking")
                                                      .doc(uid)
                                                      .set(data);
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          "bookingHosted")
                                                      .doc(widget.itemId)
                                                      .collection('UsersReque')
                                                      .doc('${name} ${surname}')
                                                      .set(data);
                                                });
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Mainbook()));
                                              }),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              });
                        }),
                        child: Text(
                          ' Book Now',
                          style: TextStyle(color: Colors.white),
                        )),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Map<String, dynamic> data = {
                            "Name": widget.itemName,
                            "Adress": widget.itemAdress,
                            "phone_number": widget.itemPhone,
                            "price": widget.itemPriced,
                            "pricem": widget.itemPricem,
                            "bail": widget.itemBail,
                            "details": widget.itemDetail,
                            "pic1": widget.itemPic,
                            "roomOwnerId": widget.itemId,
                            "hostedName": widget.itemHostedName,
                            "hostedPic": widget.itemHostedPic,
                            'CusName': '${name} ${surname}',
                            'Cusimage': image,
                            'Cusemail': email,
                            'Cusphone': phone,
                            'CusId': uid,
                          };
                          FirebaseFirestore.instance
                              .collection("fav")
                              .doc(uid)
                              .collection('room')
                              .doc(widget.itemName)
                              .set(data);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Liked'),
                            ),
                          );
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.favorite,
                            size: 33,
                            color: Colors.pink,
                          ),

                          // SizedBox(height: kDe,)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
