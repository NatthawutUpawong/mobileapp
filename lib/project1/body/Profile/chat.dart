import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/project1/body/Profile/chat_detail.dart';

import '../home/main_profile.dart';
// import 'package:flutter_application_1/Chatfold/chat_detail.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mediumColor,
        leading: IconButton(
          icon: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Mainpage3())));
            },
          ),
          onPressed: () {},
        ),
        title: const Text('Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Chatdetail()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 0.5,
                      ),
                    ),
                    height: 50,
                    width: 340,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/userImage1.jpeg'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Amanda',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                'What is your name ...?',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          '23 Mar',
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 0.5,
                      ),
                    ),
                    height: 50,
                    width: 340,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/userImage2.jpeg'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Nathi',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                'Has anyone book yet ...?',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          '25 Mar',
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 0.5,
                      ),
                    ),
                    height: 50,
                    width: 340,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/userImage3.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Laura',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                "Let's talk tomorrow ...",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          '27 Mar',
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 0.5,
                      ),
                    ),
                    height: 50,
                    width: 340,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/userImage4.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Sehun',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                "Can I have your number ...?",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          '30 Mar',
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
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

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Amanda',
    'Nathi',
    'Laura',
    'Sehun',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  IconButton buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  ListView buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var person in searchTerms) {
      if (person.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(person);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  ListView buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var person in searchTerms) {
      if (person.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(person);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
