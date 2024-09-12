import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/Profile/profie_pag1.dart';
import 'package:flutter_application_2/project1/body/home/main_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? name = '';
  String? surname = '';
  String? email = '';
  String? age = '';
  String? phone = '';
  String? image =
      'https://s3.amazonaws.com/37assets/svn/765-default-avatar.png';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  void clear() {
    _nameController.clear();
    _surnameController.clear();
    _emailController.clear();
    _imageController.clear();
    _ageController.clear();
  }

  Future updateData(String key, String newText) async {
    final documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    documentReference.update({
      key: newText,
    });
  }

  Future _getdata() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          email = snapshot.data()!["email"];
          surname = snapshot.data()!["surname"];
          age = snapshot.data()!["age"];
          phone = snapshot.data()!["phone"];
          image = snapshot.data()!['imageurl'];
        });
      }
    });
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Mainpage3())));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'EDIT PROFILE',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(image!),
                ),
                Positioned(
                  right: -5,
                  bottom: 2,
                  child: SizedBox(
                    height: 35,
                    width: 35,
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
                                          'profile', _imageController.text);
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            name!,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
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
                                                'name', _nameController.text);
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
                    //suarname
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
                            'Surname:',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Text(
                            surname!,
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
                                      title: const Text('Edit LastName'),
                                      content: TextField(
                                        controller: _surnameController,
                                        decoration: const InputDecoration(
                                            hintText: 'New LastName'),
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
                                            await updateData('surname',
                                                _surnameController.text);
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
                    //phone
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
                            'Phone :',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            phone!,
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
                                      title: const Text('Edit Phone'),
                                      content: TextField(
                                        controller: _phoneController,
                                        decoration: const InputDecoration(
                                            hintText: 'phone'),
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
                                                'phone', _phoneController.text);
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
                    //mail
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 60,
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        children: [
                          const Text(
                            'Email :',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            email!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
