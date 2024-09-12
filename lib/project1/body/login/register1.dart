import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/project1/body/Profile/profie_pag1.dart';
import 'package:flutter_application_2/project1/body/home/main_profile.dart';
import 'package:flutter_application_2/project1/body/login/palatte.dart';
import 'package:flutter_application_2/tastlogin/main_page.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fromkey = GlobalKey<FormState>();
    // text controller
    final _tcname = TextEditingController();
    final _tcsurname = TextEditingController();
    final _tcphone = TextEditingController();
    final _tcUsername = TextEditingController();
    final _tcpass = TextEditingController();
    final _tcpassagin = TextEditingController();
    final _tcurl = TextEditingController();

    // focus node
    final _focus = FocusNode();

    @override
    void dispose() {
      _tcname.dispose();
      _tcsurname.dispose();
      _tcUsername.dispose();
      _tcpass.dispose();
      _tcpassagin.dispose();
    }

    Future signUp() async {
      // final uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _tcUsername.text.trim(), password: _tcpass.text.trim())
          .then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => mainpagetast(),
          ),
        );
        FirebaseFirestore.instance
            .collection('users')
            .doc(value.user?.uid)
            .set({
          'name': _tcname.text,
          'surname': _tcsurname.text,
          'phone': _tcphone.text,
          'email': _tcUsername.text,
          'imageurl': _tcurl.text,
          'uid': value.user?.uid
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Center(
          child: Text(
            'SignUp',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.black12, Colors.white10],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
          height: 640,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  'https://gardenseaviewresort.com/images/980.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),

            // color: iconColor,
            // borderRadius: BorderRadius.circular(50)
          ),
          child: Form(
            key: _fromkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Name',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      controller: _tcname,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Name',
                        hintStyle: kbodyText,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: kbodyText2,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Surname',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      controller: _tcsurname,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Surname',
                        hintStyle: kbodyText,
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: kbodyText2,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter surname';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Phone',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      controller: _tcphone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Phone',
                        hintStyle: kbodyText,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 30,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: kbodyText2,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        } else if (int.tryParse(value) == null) {
                          return 'Put only number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'ImageProfile',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      controller: _tcurl,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'URL',
                        hintStyle: kbodyText,
                        prefixIcon: Icon(
                          Icons.link,
                          color: Colors.white,
                          size: 30,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: kbodyText2,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter URL ';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      autofocus: true,
                      focusNode: _focus,
                      controller: _tcUsername,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Email',
                        hintStyle: kbodyText,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 30,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: kbodyText2,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      controller: _tcpass,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Password',
                        hintStyle: kbodyText,
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.white,
                          size: 30,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: kbodyText2,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Confirm password',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      controller: _tcpassagin,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Confirm password',
                        hintStyle: kbodyText,
                        prefixIcon: Icon(
                          Icons.check_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: kbodyText2,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (value != _tcpass.text) {
                          return 'Do not matching';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[300]),
                        onPressed: () {
                          if (_fromkey.currentState!.validate()) {
                            signUp();
                            // print('validated');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('SignUp Success'),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'SINGUP',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          // reset from
                          _fromkey.currentState!.reset();
                          // focus to ter frist from
                          _focus.requestFocus();
                        },
                        child: const Text(
                          'RESET',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
