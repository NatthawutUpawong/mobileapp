import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/project1/body/login/login_page.dart';
import 'package:flutter_application_2/project1/body/login/palatte.dart';

class Forgotpass extends StatelessWidget {
  const Forgotpass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fromkey = GlobalKey<FormState>();
    // text controller
    final _tcemail = TextEditingController();

    @override
    void dispose() {
      _tcemail.dispose();
    }

    Future passwordReset() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(
          email: _tcemail.text.trim(),
        )
            .then((value) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('Password reset link sent! Check your email'),
                );
              });
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        });
      } on FirebaseAuthException catch (e) {
        print(e);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.message.toString()),
              );
            });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Center(
          child: Text(
            'forgot password',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
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
                    const Text(
                      'Please check email',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[300]),
                                onPressed: () {
                                  // if (_fromkey.currentState!.validate()) {
                                  //   passwordReset();
                                  //   // print('validated');
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     const SnackBar(
                                  //       content: Text('ตั้งรหัสผ่านใหม่เรียบร้อย'),
                                  //     ),
                                  //   );
                                  // }
                                  passwordReset();
                                },
                                child: const Text(
                                  'Send to Email',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
