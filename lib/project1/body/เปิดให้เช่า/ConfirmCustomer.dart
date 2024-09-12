import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/main_profile.dart';

class ConfirmCustomer extends StatefulWidget {
  const ConfirmCustomer({Key? key});

  @override
  State<ConfirmCustomer> createState() => _ConfirmCustomerState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference booking = FirebaseFirestore.instance.collection('booking');
// Assuming you have a reference to the main collection
CollectionReference mainCollectionRef =
    FirebaseFirestore.instance.collection('bookingHosted');
// Assuming you have a reference to the subcollection
CollectionReference subCollectionRef =
    mainCollectionRef.doc(uid).collection('UsersReque');

// Deleting a document in the subcollection
void deleteDocumentInSubcollection(String documentId) {
  subCollectionRef.doc(documentId).delete().then((value) {
    print('Document deleted successfully.');
  }).catchError((error) {
    print('Failed to delete document: $error');
  });
}

void deleteDocumentInSubcollectionBooking(String documentId) {
  booking.doc(documentId).delete().then((value) {
    print('Document deleted successfully.');
  }).catchError((error) {
    print('Failed to delete document: $error');
  });
}

Future<List<DocumentSnapshot>> fetchCollectionData() async {
  QuerySnapshot querySnapshot = await firestore
      .collection('bookingHosted')
      .doc(uid)
      .collection('UsersReque')
      .get();

  return querySnapshot.docs;
}

class _ConfirmCustomerState extends State<ConfirmCustomer> {
  late Future<List<DocumentSnapshot>> _fetchData;

  @override
  void initState() {
    super.initState();
    _fetchData = fetchCollectionData();
  }

  Future<void> _refreshData() async {
    setState(() {
      _fetchData = fetchCollectionData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _refreshData,
            icon: Icon(Icons.refresh),
          )
        ],
        title: Text('Confirm Reserve'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => Mainpage3())),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: _fetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<DocumentSnapshot> documents = snapshot.data!;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(documents[index]['CusName']),
                    subtitle: Text('Phone: ${documents[index]['Cusphone']}'),
                    leading: SizedBox(
                        height: 60,
                        width: 60,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            documents[index]['Cusimage'],
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                        )),
                    trailing: IconButton(
                      onPressed: () {
                        deleteDocumentInSubcollection(
                            documents[index]['CusName']);
                        deleteDocumentInSubcollectionBooking(
                            documents[index]['CusId']);
                        _refreshData();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(child: Text('CONFIRM')),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                      child: Text('CONFIRM'),
                                      onPressed: () {
                                        setState(() {
                                          Map<String, dynamic> data = {
                                            "Name": documents[index]['Name'],
                                            "Adress": documents[index]
                                                ['Adress'],
                                            "phone_number": documents[index]
                                                ['phone_number'],
                                            "price": documents[index]['price'],
                                            "pricem": documents[index]
                                                ['pricem'],
                                            "bail": documents[index]['bail'],
                                            "details": documents[index]
                                                ['details'],
                                            "pic1": documents[index]['pic1'],
                                            "roomOwnerId": documents[index]
                                                ['roomOwnerId'],
                                            "hostedName": documents[index]
                                                ['hostedName'],
                                            "hostedPic": documents[index]
                                                ['hostedPic'],
                                            'CusName': documents[index]
                                                ['CusName'],
                                            'Cusimage': documents[index]
                                                ['Cusimage'],
                                            'Cusemail': documents[index]
                                                ['Cusemail'],
                                            'Cusphone': documents[index]
                                                ['Cusphone'],
                                            'CusId': documents[index]['CusId'],
                                          };
                                          FirebaseFirestore.instance
                                              .collection("record")
                                              .doc(documents[index]['CusId'])
                                              .collection('recordroom')
                                              .doc(documents[index]['Name'])
                                              .set(data);

                                          deleteDocumentInSubcollection(
                                              documents[index]['CusName']);
                                          deleteDocumentInSubcollectionBooking(
                                              documents[index]['CusId']);
                                          _refreshData();
                                          Navigator.of(context).pop();
                                        });
                                      })
                                ],
                              ),
                            ],
                          );
                        }
                        )
                        );
              },
            );
          }
        },
      ),
    );
  }
}
