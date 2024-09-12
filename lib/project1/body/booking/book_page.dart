import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/project1/body/fav/fav_page.dart';

import '../home/main_booking.dart';

class Bookpage extends StatefulWidget {
  const Bookpage({
    super.key,
  });

  @override
  State<Bookpage> createState() => _BookpageState();
}

// Assuming you have a reference to the main collection
CollectionReference mainCollectionRef =
    FirebaseFirestore.instance.collection('bookingHosted');
// Assuming you have a reference to the subcollection
// CollectionReference subCollectionRef = mainCollectionRef
//     .doc('K8LImDdIU3ZJPqoJAENnFf5qpZH2')
//     .collection('UsersReque');

// Deleting a document in the subcollection
// void deleteDocumentInSubcollection(String documentId) {
//   subCollectionRef.doc(documentId).delete().then((value) {
//     print('Document deleted successfully.');
//   }).catchError((error) {
//     print('Failed to delete document: $error');
//   });
// }
CollectionReference booking = FirebaseFirestore.instance.collection('booking');
void deleteDocumentInSubcollectionBooking(String documentId) {
  booking.doc(documentId).delete().then((value) {
    print('Document deleted successfully.');
  }).catchError((error) {
    print('Failed to delete document: $error');
  });
}

class _BookpageState extends State<Bookpage> {
  final user = FirebaseAuth.instance.currentUser!;
  String? name = 'Do not Reserve yet';
  String? email = '';
  String? surname = '';
  String? status = "Can't Continue the Transaction";
  String? image =
      'https://t3.ftcdn.net/jpg/03/88/40/56/360_F_388405670_0CyoZYAqHUGJkwxWxq6FquVGjEv4UJ5K.jpg';
  String? phone = '';
  String? Address = '';
  String? CusName = '';
  String? roomOwnerId = '';

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("booking")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["Name"];
          image = snapshot.data()!["pic1"];
          phone = snapshot.data()!["phone_number"];
          status = 'Please Contact OwnerRoom';
          CusName = snapshot.data()!["CusName"];
          roomOwnerId = snapshot.data()!["roomOwnerId"];
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
        body: StatefulBuilder(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Booking',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(name!),
                    subtitle: Text(status!),
                    leading: SizedBox(
                        height: 60,
                        width: 60,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            image!,
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                        )),
                    trailing: IconButton(
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
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: Text('OK'),
                                            onPressed: () {
                                              setState(() {
                                                state(
                                                  () {},
                                                );
                                                deleteDocumentInSubcollectionBooking(
                                                    uid);
                                                CollectionReference
                                                    subCollectionRef =
                                                    mainCollectionRef
                                                        .doc(roomOwnerId)
                                                        .collection(
                                                            'UsersReque');
                                                subCollectionRef
                                                    .doc(CusName)
                                                    .delete()
                                                    .then((value) {
                                                  print(
                                                      'Document deleted successfully.');
                                                }).catchError((error) {
                                                  print(
                                                      'Failed to delete document: $error');
                                                });
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            Mainbook()));
                                              });
                                            })
                                      ],
                                    ),
                                  ],
                                );
                              });
                        }),
                        icon: Icon(Icons.delete)),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
