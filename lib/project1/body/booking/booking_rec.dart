import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/home/main_profile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../fav/fav_page.dart';

class BookingReec extends StatefulWidget {
  const BookingReec({super.key});

  @override
  State<BookingReec> createState() => _BookingReecState();
}

class _BookingReecState extends State<BookingReec> {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<List<DocumentSnapshot>> fetchCollectionData() async {
    QuerySnapshot querySnapshot = await firestore
        .collection('record')
        .doc(uid)
        .collection('recordroom')
        .get();

    return querySnapshot.docs;
  }

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text('History'),
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
        body: StatefulBuilder(builder: (context, state) {
          return Column(
            children: [
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
                                  icon: Icon(Icons.star_rate_sharp),
                                  onPressed: (() => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              Text('Rate This'),
                                              Center(
                                                  child: RatingBar.builder(
                                                minRating: 1,
                                                itemBuilder:
                                                    ((context, index) => Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        )),
                                                onRatingUpdate: (((rating) =>
                                                    setState(() {
                                                      this.rating = rating;
                                                    }))),
                                              )),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white),
                                                  child: Text(
                                                    'CANCEL',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white),
                                                    child: Text('CONFIRM',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.blue)),
                                                    onPressed: () {
                                                      setState(() {
                                                        Map<String, dynamic>
                                                            data = {
                                                          'name':
                                                              documents[index]
                                                                  ['Name'],
                                                          "CusId":
                                                              documents[index]
                                                                  ['CusId'],
                                                          "rating": rating,
                                                        };
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "Rating")
                                                            .doc(
                                                                documents[index]
                                                                    ['CusId'])
                                                            .set(data);

                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    })
                                              ],
                                            ),
                                          ],
                                        );
                                      })),
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
          );
        }));
  }
}
