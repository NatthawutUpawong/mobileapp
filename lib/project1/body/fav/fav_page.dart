import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/project1/body/fav/favDetail.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;

FirebaseFirestore firestore = FirebaseFirestore.instance;

// Assuming you have a reference to the main collection
CollectionReference mainCollectionRef =
    FirebaseFirestore.instance.collection('fav');
// Assuming you have a reference to the subcollection
CollectionReference subCollectionRef =
    mainCollectionRef.doc(uid).collection('room');

// Deleting a document in the subcollection
void deleteDocumentInSubcollection(String documentId) {
  subCollectionRef.doc(documentId).delete().then((value) {
    print('Document deleted successfully.');
  }).catchError((error) {
    print('Failed to delete document: $error');
  });
}

Future<List<DocumentSnapshot>> fetchCollectionData() async {
  QuerySnapshot querySnapshot =
      await firestore.collection('fav').doc(uid).collection('room').get();

  return querySnapshot.docs;
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatefulBuilder(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child: SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'FAVORITE',
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
                child: Divider(
                  thickness: 2.5,
                ),
              ),
              Expanded(
                child: FutureBuilder<List<DocumentSnapshot>>(
                  future: fetchCollectionData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<DocumentSnapshot> documents = snapshot.data!;
                      return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(documents[index]['Name']),
                                subtitle: Text(
                                    'Price: ฿${documents[index]['pricem']}'),
                                leading: Image.network(
                                  documents[index]['pic1'],
                                  scale: 6,
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: (() {
                                    deleteDocumentInSubcollection(
                                        documents[index]['Name']);
                                    state(
                                      () {},
                                    );
                                  }),
                                ),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FavDetail(
                                          documents: documents[index]),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  thickness: 2.5,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
