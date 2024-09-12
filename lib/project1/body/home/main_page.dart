import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/home/main_fav.dart';
import '../fav/fav_page.dart';
import '../searchscreen/search1.dart';
import '../เปิดให้เช่า/create_dorm.dart';

class Menupage extends StatefulWidget {
  const Menupage({super.key});

  @override
  State<Menupage> createState() => _MenupageState();
}

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Retrieve all documents in the collection
  List<DocumentSnapshot> documentSnapshots = await getAllDocuments();

  // Access the data within each document
  for (DocumentSnapshot documentSnapshot in documentSnapshots) {
    if (documentSnapshot.exists) {
      Object? data = documentSnapshot.data();
      print(data);
    } else {
      print('Document does not exist.');
    }
  }
}

Future<List<DocumentSnapshot>> getAllDocuments() async {
  // Replace 'YOUR_COLLECTION' with the actual name of your collection
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('room').get();

  return querySnapshot.docs;
}

class _MenupageState extends State<Menupage> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Future<List<DocumentSnapshot>> fetchCollectionData() async {
    QuerySnapshot querySnapshot =
        await firestore.collection('fav').doc(uid).collection('room').get();

    return querySnapshot.docs;
  }

  Future<DocumentSnapshot> room() async {
    DocumentSnapshot documentSnapshot =
        await firestore.collection('room').doc().get();

    return documentSnapshot;
  }

  final user = FirebaseAuth.instance.currentUser!;
  String? name = '';
  String? email = '';
  String? surname = '';
  String? image =
      'https://www.shutterstock.com/image-illustration/three-dimensional-render-blue-wavy-600w-2262760763.jpg';
  String? phone = '';

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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Hi ${name}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(image!),
                            radius: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: InkWell(
                              onTap: (() => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          FilterableListView())))),
                              child: Container(
                                  height: 45,
                                  // width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Search',
                                            style: TextStyle(
                                                color: Colors.grey.shade500)),
                                        Icon(
                                          Icons.search,
                                          color: Colors.grey.shade400,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          IconButton(
                              onPressed: (() => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => createdorm())))),
                              icon: Icon(
                                Icons.home_work_rounded,
                                size: 40,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'For You',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: (() => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        FilterableListView())))),
                            child: Row(
                              children: [
                                Text(
                                  'See all ',
                                  style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontSize: 14,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: Colors.blue.shade700,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      StatefulBuilder(builder: (context, state) {
                        return FutureBuilder<List<DocumentSnapshot>>(
                          future: getAllDocuments(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<DocumentSnapshot> documents = snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      child: ListView.builder(
                                        itemCount: documents.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                              // height: 200,
                                              width: 280,
                                              margin: EdgeInsets.all(20),
                                              child: Card(
                                                child: Wrap(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        child: Image.network(
                                                          documents[index]
                                                              ['pic1'],
                                                          fit: BoxFit.cover,
                                                          height: 175,
                                                          width: 280,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            documents[index]
                                                                ['Name'],
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  '฿${documents[index]['price']}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blue
                                                                          .shade900,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                              Text('/n')
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      subtitle: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .phone_android_outlined,
                                                                size: 16,
                                                                color: Colors
                                                                    .blue
                                                                    .shade900,
                                                              ),
                                                              Text(
                                                                  " ${documents[index]['phone_number']}"),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '฿${documents[index]['pricem']}',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue
                                                                        .shade900,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              Text('/m')
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        );
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Favorite',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: (() => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Mainfav())))),
                            child: Row(
                              children: [
                                Text(
                                  'See all ',
                                  style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontSize: 14,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: Colors.blue.shade700,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      StatefulBuilder(builder: (context, state) {
                        return FutureBuilder<List<DocumentSnapshot>>(
                          future: fetchCollectionData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<DocumentSnapshot> documents = snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 280,
                                      child: ListView.builder(
                                        itemCount: documents.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                              // height: 200,
                                              width: 230,
                                              margin: EdgeInsets.all(20),
                                              child: Card(
                                                child: Wrap(
                                                  children: [
                                                    Center(
                                                      child: Image.network(
                                                        documents[index]
                                                            ['pic1'],
                                                        fit: BoxFit.cover,
                                                        height: 165,
                                                        width: 200,
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        documents[index]
                                                            ['Name'],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      subtitle: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .phone_android_outlined,
                                                                size: 16,
                                                                color: Colors
                                                                    .blue
                                                                    .shade900,
                                                              ),
                                                              Text(
                                                                  " ${documents[index]['phone_number']}"),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '฿${documents[index]['pricem']}',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue
                                                                        .shade900,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              Text('/m')
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
