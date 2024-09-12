import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Chatfold/chat.dart';
import 'package:flutter_application_2/project1/body/Profile/chat.dart';

class Chatdetail extends StatefulWidget {
  const Chatdetail({super.key});

  @override
  State<Chatdetail> createState() => _ChatdetailState();
}

class _ChatdetailState extends State<Chatdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ChatPage()));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/userImage1.jpeg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amanda',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'online',
                        style: TextStyle(fontSize: 12, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            
            Text('Say Hi'),
            Spacer(),
            Row(
              children: [
                //input filed & button
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.emoji_emotions,
                              color: Colors.grey, size: 25),
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: 'Type Something...',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.image, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),

                //send message butoon
                MaterialButton(
                  onPressed: () {},
                  minWidth: 0,
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
                  shape: CircleBorder(),
                  color: Colors.blue,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
