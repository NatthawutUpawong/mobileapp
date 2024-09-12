import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/project1/body/home/Homescreen.dart';
import 'package:flutter_application_2/project1/body/home/main_profile.dart';

class createdorm extends StatefulWidget {
  const createdorm({Key? key}) : super(key: key);

  @override
  State<createdorm> createState() => _createdormState();
}

// data from FireStore

class _createdormState extends State<createdorm> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
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

  final _cusdetailStream =
      FirebaseFirestore.instance.collection('cusdetail').snapshots();
  final _fromkey = GlobalKey<FormState>();
  // text controller
  final _Cname = TextEditingController();
  final _Chouse_number = TextEditingController();
  final _Cprovince = TextEditingController();
  final _Cdistrict = TextEditingController();
  final _Csubdis = TextEditingController();
  final _Czipcode = TextEditingController();
  final _Cphone = TextEditingController();
  final _CpriceDay = TextEditingController();
  final _CpriceMonth = TextEditingController();
  final _Cbail = TextEditingController();
  final _Crule = TextEditingController();
  final _Clink = TextEditingController();

  // focus node
  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mediumColor,
        leading: IconButton(
          icon: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Mainpage())));
            },
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Dormitory information',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _fromkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              const Text(
                'Dormitory Name',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _Cname,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Dormitory Name',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Dormitory Name';
                  }
                  return null;
                },
              ),
              const Text(
                'Province',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _Cprovince,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Province',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Province';
                  }
                  return null;
                },
              ),
              const Text(
                'District',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _Cdistrict,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'District',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put District';
                  }
                  return null;
                },
              ),
              const Text(
                'Subdistrict',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _Csubdis,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Subdistrict',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Subdistrict ';
                  }
                  return null;
                },
              ),
              const Text(
                'Zip-Code',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _Czipcode,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Zip-Code',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Zip-Code';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Price/Day',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _CpriceDay,
                // obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Price/Day',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Number';
                  } else if (int.tryParse(value) == null) {
                    return 'Please Put Number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Price/Month',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _CpriceMonth,
                // obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Price/Month',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Number';
                  } else if (int.tryParse(value) == null) {
                    return 'Please Put Number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Bail',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _Cbail,
                // obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Price Bail',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Number';
                  } else if (int.tryParse(value) == null) {
                    return 'Please Put Number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'MoreDetail,Rules',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _Crule,
                // obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Detail',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Detail';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'ImageDormitory',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _Clink,
                // obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Link URLDormitory',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Put Link URLDormitory';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      if (_fromkey.currentState!.validate()) {
                        // print('validated');
                        Map<String, dynamic> data = {
                          "Name": _Cname.text,
                          "house_number": _Chouse_number.text,
                          "province": _Cprovince.text,
                          "district": _Cdistrict.text,
                          "Subdistrict": _Csubdis.text,
                          "zip_code": _Czipcode.text,
                          "phone_number": phone,
                          "price": _CpriceDay.text,
                          "pricem": _CpriceMonth.text,
                          "bail": _Cbail.text,
                          "details": _Crule.text,
                          "pic1": _Clink.text,
                          "uid": uid,
                          "hostedName": name,
                          "hostedPic": image,
                        };
                        FirebaseFirestore.instance
                            .collection("room")
                            .doc(uid)
                            .set(data)
                            .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Mainpage3(),
                                  ),
                                ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('CreateDormitorySuccess'),
                          ),
                        );
                      }
                    },
                    child: Text('CreateDormitory'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
