import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/project1/body/Profile/chat.dart';
import 'package:flutter_application_2/project1/data/PicCus.dart';
import '../home/Homescreen.dart';

class Body_room extends StatefulWidget {
  final CusPic cusPic;
  Body_room(this.cusPic);

  @override
  State<Body_room> createState() => _Body_roomState();
}

class _Body_roomState extends State<Body_room> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: size.height * 0.4,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.4 - 50,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.cusPic.urlimage))),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: size.width * 0.9,
                    height: 80,
                    decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 50,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.star_rate_rounded,
                              size: 33,
                              color: Colors.yellow[700],
                            ),
                            RichText(
                                text: TextSpan(
                                    text: widget.cusPic.rating,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)))
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.star_border_rounded,
                                size: 33,
                                color: Colors.black54,
                              ),
                              const Text(
                                'Rate This',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                              // SizedBox(height: kDe,)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.favorite,
                                size: 33,
                                color: Colors.pink,
                              ),
                              const Text(
                                'Like This',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                              // SizedBox(height: kDe,)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage())),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.chat_sharp,
                                color: Colors.blue[400],
                                size: 33,
                              ),
                              // SizedBox(height: ,),
                              const Text(
                                'Chat',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              SafeArea(
                child: IconButton(
                    onPressed: (() {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Mainpage())));
                      });
                    }),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 25,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.cusPic.textTitle,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Address',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(widget.cusPic.address),
              Text(
                'Phone',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(widget.cusPic.phonenumber),
              Text('Detail', style: TextStyle(fontWeight: FontWeight.w600)),
              Text(widget.cusPic.roomdetail),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Text('price', style: TextStyle(fontWeight: FontWeight.w600)),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(children: <Widget>[
                Text(
                  'X,XXX',
                  style: TextStyle(color: Colors.red[800]),
                ),
                Spacer(),
                ElevatedButton(onPressed: (() {}), child: Text('จอง'))
              ]),
            ],
          ),
        )
      ],
    );
  }
}
