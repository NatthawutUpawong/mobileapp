import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/home/main_profile.dart';
import 'package:flutter_application_2/project1/body/login/palatte.dart';
import 'package:flutter_application_2/project1/body/login/register1.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'forgotpass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _fromkey = GlobalKey<FormState>();

    final _tcemail = TextEditingController();
    final _tcpass = TextEditingController();

    Future signIn() async {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _tcemail.text.trim(), password: _tcpass.text.trim())
            .then((value) {
          Fluttertoast.showToast(
              msg: 'Success',
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.white,
              textColor: Colors.green);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Mainpage3()));
        });
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
            msg: e.message!,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.white,
            textColor: Colors.red);
      }
    }

    @override
    void dispose() {
      _tcemail.dispose();
      _tcpass.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          ShaderMask(
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
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),

                // color: iconColor,
                // borderRadius: BorderRadius.circular(50)
              ),
              child: Form(
                key: _fromkey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: const Text(
                          "Room",
                          style: kHeading,
                        ),
                      ),
                      Center(
                        child: const Text(
                          "Rental",
                          style: kHeading2,
                        ),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300]?.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextFormField(
                                controller: _tcemail,
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
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300]?.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextFormField(
                                obscureText: true,
                                controller: _tcpass,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Password',
                                  hintStyle: kbodyText,
                                  prefixIcon: Icon(
                                    Icons.key,
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
                          ],
                        ),
                      ),
                      const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Forgotpass(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: Colors.red[400], fontSize: 16),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()));
                              },
                              child: Text(
                                'Create new account',
                                style: TextStyle(
                                    color: Colors.blue[300], fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(300, 50),
                                  backgroundColor: Colors.blue[300]),
                              onPressed: () {
                                if (_fromkey.currentState!.validate()) {
                                  signIn();
                                  // print('validated');
                                }
                              },
                              child: const Text(
                                'SIGNIN',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
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
        ],
      ),
    );
  }
}


 //  if (_fromkey.currentState!.validate()) {
                          //     // print('validated');
                          //     signIn();
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //         content: Text('เข้าสู่ระบบสำเร็จ'),
                          //       ),
                          //     );
                          //   }

                          //   Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: ((context) => Mainpage())));