import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../home/main_booking.dart';
import '../home/main_fav.dart';

class FavDetail extends StatefulWidget {
  final DocumentSnapshot documents;
  const FavDetail({super.key, required this.documents});

  @override
  State<FavDetail> createState() => _FavDetailState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;

class _FavDetailState extends State<FavDetail> {
  String? name = '';
  String? email = '';
  String? surname = '';
  String? image =
      'https://t3.ftcdn.net/jpg/03/88/40/56/360_F_388405670_0CyoZYAqHUGJkwxWxq6FquVGjEv4UJ5K.jpg';
  String? phone = '';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.documents['pic1']))),
                  ),
                ),
                Positioned(
                    top: 190,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.documents['Name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '฿${widget.documents['pricem']}/',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text('Month')
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                SafeArea(
                  child: IconButton(
                      onPressed: (() {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Mainfav())));
                        });
                      }),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 25,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Bail',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          ' ฿${widget.documents['bail']}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              '฿${widget.documents['price']}/',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 2.5,
                      ),
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
                    Text(widget.documents['Adress']),
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
                    Text(widget.documents['details']),
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
                      title: Text('Name ${widget.documents['hostedName']}'),
                      leading: SizedBox(
                          height: 60,
                          width: 60,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              widget.documents['hostedPic'],
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(5),
                          )),
                      subtitle:
                          Text('Phone ${widget.documents['phone_number']}'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
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
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: Text('OK'),
                                            onPressed: () {
                                              Map<String, dynamic> data = {
                                                "Name":
                                                    widget.documents['Name'],
                                                "Adress":
                                                    widget.documents['Adress'],
                                                "phone_number": widget
                                                    .documents['phone_number'],
                                                "price":
                                                    widget.documents['price'],
                                                "pricem":
                                                    widget.documents['pricem'],
                                                "bail":
                                                    widget.documents['bail'],
                                                "details":
                                                    widget.documents['details'],
                                                "pic1":
                                                    widget.documents['pic1'],
                                                "roomOwnerId": widget
                                                    .documents['roomOwnerId'],
                                                "hostedName": widget
                                                    .documents['hostedName'],
                                                "hostedPic": widget
                                                    .documents['hostedPic'],
                                                'CusName': '${name} ${surname}',
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
                                                  .collection("bookingHosted")
                                                  .doc(widget
                                                      .documents['roomOwnerId'])
                                                  .collection('UsersReque')
                                                  .doc('${name} ${surname}')
                                                  .set(data);

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Mainbook()));
                                            })
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 50),
                            backgroundColor: Colors.blue),
                        child: const Text(
                          ' Book Now',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
