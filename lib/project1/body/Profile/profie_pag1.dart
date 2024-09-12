import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/%E0%B9%80%E0%B8%9B%E0%B8%B4%E0%B8%94%E0%B9%83%E0%B8%AB%E0%B9%89%E0%B9%80%E0%B8%8A%E0%B9%88%E0%B8%B2/ConfirmCustomer.dart';
import 'package:flutter_application_2/project1/body/Profile/editprofile1.dart';
import 'package:flutter_application_2/project1/body/booking/booking_rec.dart';
import 'package:flutter_application_2/project1/body/home/main_fav.dart';
import 'package:flutter_application_2/tastlogin/main_page.dart';
import '../home/main_profile.dart';
import '../เปิดให้เช่า/roomProfile.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final user = FirebaseAuth.instance.currentUser!;
  String? name = '';
  String? email = '';
  String? surname = '';
  String? image =
      'https://www.shutterstock.com/image-illustration/three-dimensional-render-blue-wavy-600w-2262760763.jpg';
  String? phone = '';

  void signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => mainpagetast())));
    });
  }

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          email = snapshot.data()!["email"];
          surname = snapshot.data()!["surname"];
          image = snapshot.data()!["imageurl"];
          phone = snapshot.data()!["phone"];
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
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(image!),
                      radius: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${name} ${surname}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 320,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.mail),
                      const SizedBox(width: 20),
                      Text('${email}'),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 320,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.phone),
                      const SizedBox(width: 20),
                      Text('${phone}'),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              //Favorite
              children: [
                InkWell(
                  onTap: (() => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BookingReec()))),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: Row(
                      children: const [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.history),
                        SizedBox(width: 20),
                        Text('History'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              //Favorite
              children: [
                InkWell(
                  onTap: (() => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Mainfav()))),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: Row(
                      children: const [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.favorite),
                        SizedBox(width: 20),
                        Text('Favorite'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: (() => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfile()))),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: Row(
                      children: const [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.edit_outlined),
                        SizedBox(width: 20),
                        Text('Editprofile'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: (() => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmCustomer()))),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: Row(
                      children: const [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.checklist_rtl_outlined),
                        SizedBox(width: 20),
                        Text('Check Request'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              //My Room
              children: [
                InkWell(
                  onTap: (() => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => roomProfile()))),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: Row(
                      children: const [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.home_work_sharp),
                        SizedBox(width: 20),
                        Text('Editroom'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  //Log out
                  onTap: (() => signOut()),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: Row(
                      children: const [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Log out',
                          style: TextStyle(color: Colors.red),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
