// CRUD: create, read, update, delete

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrudDemo extends StatefulWidget {
  const CrudDemo({super.key});

  @override
  State<CrudDemo> createState() => _CrudDemoState();
}

class _CrudDemoState extends State<CrudDemo> {
  // data will be from db
  // final List users = [
  //   {'name': 'Logan', 'age': 45},
  //   {'name': 'Laura', 'age': 14},
  // ];

  // data from FireStore
  final _userStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  // text controllers
  final _tcName = TextEditingController();
  final _tcAge = TextEditingController();

  // =================== CRUD functions =================
  // --- Delete ---
  Future<void> deleteData(String docId) async {
    // show alert dialog
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sure to delete data?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // delete the data
    if (answer == 'OK') {
      FirebaseFirestore.instance.collection('users').doc(docId).delete().then(
            (value) => print('Document deleted!'),
            onError: (e) => print('Error $e'),
          );
    }
  }

  // --- Add ---
  Future<void> addData() async {
    // clear inputs
    _tcName.text = '';
    _tcAge.text = '';

    // show alert dialog
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new user'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tcName,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: _tcAge,
                decoration: const InputDecoration(hintText: 'Age'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // add data to db
    if (answer == 'OK') {
      String name = _tcName.text;
      int age = int.parse(_tcAge.text);
      var data = {'name': name, 'age': age};
      // print(name);
      // print(age.toString());
      FirebaseFirestore.instance.collection('users').add(data).then(
            (value) => print('Adding done!'),
            onError: (e) => print('Error $e'),
          );
    }
  }

  // --- edit data ---
  Future<void> editData(String docId) async {
    // show alert dialog
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new user'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tcName,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: _tcAge,
                decoration: const InputDecoration(hintText: 'Age'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // edit data in db
    if (answer == 'OK') {
      String name = _tcName.text;
      int age = int.parse(_tcAge.text);
      var data = {'name': name, 'age': age};
      // print(name);
      // print(age.toString());
      FirebaseFirestore.instance
          .collection('users')
          .doc(docId)
          .update(data)
          .then(
            (value) => print('Updating done!'),
            onError: (e) => print('Error $e'),
          );
    }
  }
  // ====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD demo'),
        actions: [
          IconButton(
            onPressed: addData,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _userStream,
        builder: (context, snapshot) {
          // Connection error
          if (snapshot.hasError) {
            return const Text('Connection error');
          }

          // Connecting...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }

          // Data is ready
          // convert snapshot to List
          var docs = snapshot.data!.docs;
          // return Text('${docs[0]['name']}');
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: IconButton(
                  onPressed: () {
                    editData(docs[index].id);
                    _tcName.text = docs[index]['name'];
                    _tcAge.text = docs[index]['age'].toString();
                  },
                  icon: const Icon(Icons.edit),
                ),
                title: Text(docs[index]['name']),
                subtitle: Text("${docs[index]['age']} years old"),
                trailing: IconButton(
                  onPressed: () {
                    // delete the selected row
                    deleteData(docs[index].id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
