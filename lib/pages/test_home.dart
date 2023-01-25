import 'package:flutter/material.dart';
import 'package:poojagoodie_app/core/consts.dart';

import '../Widgets/text_widget.dart';
import '../models/channel_Model.dart';
import '../services/api_service.dart';

class testHome extends StatefulWidget {
  const testHome({super.key});

  @override
  State<testHome> createState() => _testHomeState();
}

class _testHomeState extends State<testHome> {
  Channel? _channel;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCUUIz69kK3Ib5bD4hWLKAwA', '');
    setState(() {
      _channel = channel;
    });
  }

  final List<String> _listItem = [
    'UCRUAdVm9ZOF4JheOd8qIQHA',
    'UCDe0DwkMVFfSIoiYdQUPQmQ',
    'UCJeQx6mAyNdPUc9sJA866Xw',
    'UCnm6-cpofD8jJig1lTJ_1Zw',
    'UCqeWBXm4RSDhGt_1ouFlQ_w',
    'UCUUIz69kK3Ib5bD4hWLKAwA',
    'UC8Igqo3g1U40n66BLb-xHuQ',
    'UCCR5eciEJIMvX2o1tiYOUKQ',
    'UCfwa_zKl8-zC9rQDWIEixgg',
    'UCT_QwW7Tbew5qrYNb2auqAQ',
    'UC04m8d9t8UeWZ5DuvQVnqiw',
    'UC6vQRTCxutg6fJLUGkDKynQ',
    'UCOizxR3GwY7dmehMCAdvv9g',
    'UCyIkg79GpPVF77qYKoAINtw',
    'UCDqkux3AH7P9hRjmunoUeAQ',
    'UC7ZivIYRB0fMSGh-THcTYbw',
    'UCaayLD9i5x4MmIoVZxXSv_g',
    'UCHKGDg0GJKBsA9mFraDOLHA',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 59, 58),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.orange,
        ),
        title: textWidget(text: "Home", color: Colors.orange, fontSize: 20),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 340,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Pooja Tube",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Whach Live",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: _channel != null
                      ? GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          padding: EdgeInsets.all(20.0),
                          children: List.generate(_listItem.length, (index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 74, 69, 66),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 35,
                                      backgroundImage: NetworkImage(
                                          _channel!.profilePictureUrl),
                                    ),
                                  ),
                                  bigspace,
                                  textWidget(
                                      text: _channel!.title,
                                      color: Colors.orange)
                                ],
                              ),
                            );
                          }),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
