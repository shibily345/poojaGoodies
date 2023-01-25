import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:poojagoodie_app/Widgets/text_widget.dart';
import 'package:poojagoodie_app/core/consts.dart';
import 'package:poojagoodie_app/models/channel_Model.dart';
import 'package:poojagoodie_app/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:poojagoodie_app/utilities/keys.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        .fetchChannel(channelId: 'UCDe0DwkMVFfSIoiYdQUPQmQ', '');
    setState(() {
      _channel = channel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _channel != null
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 18,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      GridTile(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35,
                          backgroundImage:
                              NetworkImage(_channel!.profilePictureUrl),
                        ),
                      ),
                      textWidget(text: _channel!.title)
                    ],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
