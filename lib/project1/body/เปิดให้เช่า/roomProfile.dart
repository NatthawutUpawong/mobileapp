import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/fav/favDetail.dart';

import '../home/main_profile.dart';

class roomProfile extends StatefulWidget {
  const roomProfile({super.key});

  @override
  State<roomProfile> createState() => _roomProfileState();
}

class _roomProfileState extends State<roomProfile> {
  String? name = '';
  String? subdistrict = '';
  String? district = '';
  String? province = '';
  String? zip_code = '';
  String? phone_number = '';
  String? priced = '';
  String? pricem = '';
  String? bail = '';
  String? detail = '';
  String? image = '';

  final userid = FirebaseAuth.instance.currentUser!.uid;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _subdistrictController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _zip_codeController = TextEditingController();
  TextEditingController _phone_numberController = TextEditingController();
  TextEditingController _pricedController = TextEditingController();
  TextEditingController _pricemController = TextEditingController();
  TextEditingController _bailController = TextEditingController();
  TextEditingController _detailController = TextEditingController();

  void clear() {
    _nameController.clear();
    _imageController.clear();
    _subdistrictController.clear();
    _provinceController.clear();
    _districtController.clear();
    _zip_codeController.clear();
    _phone_numberController.clear();
    _pricedController.clear();
    _pricemController.clear();
    _bailController.clear();
    _detailController.clear();
  }

  Future updateData(String key, String newText) async {
    final documentReference = FirebaseFirestore.instance
        .collection('room')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    debugPrint(newText);
    documentReference.update({
      key: newText,
    });
  }

  Future _getdata() async {
    await FirebaseFirestore.instance
        .collection("room")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["Name"];
          subdistrict = snapshot.data()!["Subdistrict"];
          district = snapshot.data()!['district'];
          province = snapshot.data()!["province"];
          zip_code = snapshot.data()!['zip_code'];
          phone_number = snapshot.data()!['phone_number'];
          priced = snapshot.data()!['price'];
          pricem = snapshot.data()!['pricem'];
          bail = snapshot.data()!['bail'];
          detail = snapshot.data()!['details'];
          image = snapshot.data()!['pic1'];
        });
      }
    });
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  void deleteDocument(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('room')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete()
          .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Mainpage3(),
                ),
              ));
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Mainpage3())));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'EDIT ROOM',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            //pic
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              height: 250,
              width: 300,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(image!),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(image!))),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(color: Colors.white),
                          ),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Edit Profile'),
                                  content: TextField(
                                    controller: _imageController,
                                    decoration: const InputDecoration(
                                        hintText: 'Profile URL'),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      child: const Text('CANCEL'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                      child: const Text('OK'),
                                      onPressed: () async {
                                        await updateData(
                                            'pic1', _imageController.text);
                                        clear();
                                        // do something with the text
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        },
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PUBILC INFORMATION',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),

                      //name
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'Name:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              name!,
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Name'),
                                        content: TextField(
                                          controller: _nameController,
                                          decoration: const InputDecoration(
                                              hintText: 'New Name'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData(
                                                  'Name', _nameController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //province
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'Province:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              province!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Province'),
                                        content: TextField(
                                          controller: _provinceController,
                                          decoration: const InputDecoration(
                                              hintText: 'New Province'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData('province',
                                                  _provinceController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //district
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'District:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(child: Text(
                              district!,
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),),
                            
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit District'),
                                        content: TextField(
                                          controller: _districtController,
                                          decoration: const InputDecoration(
                                              hintText: 'New District'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData('district',
                                                  _districtController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //sub
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'Subdistrict:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              subdistrict!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Subdistrict'),
                                        content: TextField(
                                          controller: _subdistrictController,
                                          decoration: const InputDecoration(
                                              hintText: 'New Subdistrict'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData('Subdistrict',
                                                  _subdistrictController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //zipcode
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'Zip Code:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              zip_code!,
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Zip Code'),
                                        content: TextField(
                                          controller: _zip_codeController,
                                          decoration: const InputDecoration(
                                              hintText: 'New Zip Code'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData('zip_code',
                                                  _zip_codeController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //number
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'Contact Number:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              phone_number!,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Edit Contact Number'),
                                        content: TextField(
                                          controller: _phone_numberController,
                                          decoration: const InputDecoration(
                                              hintText: 'New Contact Number'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData('phone_number',
                                                  _phone_numberController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //p-day
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'Price/Day:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              priced!,
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Price/Day'),
                                        content: TextField(
                                          controller: _pricedController,
                                          decoration: const InputDecoration(
                                              hintText: 'New Price/Day'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData('price',
                                                  _pricedController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //p-month
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'Price/Month:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              pricem!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Price/Month'),
                                        content: TextField(
                                          controller: _pricemController,
                                          decoration: const InputDecoration(
                                              hintText: 'New Price/Month'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData('pricem',
                                                  _pricemController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //bail
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            const Text(
                              'Bail:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              bail!,
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Bail'),
                                        content: TextField(
                                          controller: _bailController,
                                          decoration: const InputDecoration(
                                              hintText: 'New Bail'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue),
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              await updateData(
                                                  'bail', _bailController.text);
                                              clear();
                                              // do something with the text
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      //detail
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 320,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Details:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                detail!,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Edit Details'),
                                      content: TextField(
                                        controller: _detailController,
                                        decoration: const InputDecoration(
                                            hintText: 'New Details'),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          child: const Text('CANCEL'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                          ),
                                          child: const Text('OK'),
                                          onPressed: () async {
                                            await updateData('details',
                                                _detailController.text);
                                            clear();
                                            // do something with the text
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 18,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10.0),
                    ],
                  ),
                ],
              ),
            ),

            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Delete'),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              child: const Text('CANCEL'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue),
                              child: const Text('OK'),
                              onPressed: () {
                                deleteDocument('room');
                                // do something with the text
                              },
                            )
                          ],
                        );
                      });
                },
                child: const Text('Delete Room'))
          ],
        ),
      ),
    );
  }
}
