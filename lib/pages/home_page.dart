import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:poojagoodie_app/Widgets/text_widget.dart';
import 'package:poojagoodie_app/core/consts.dart';
import 'package:poojagoodie_app/models/channel_Model.dart';
import 'package:poojagoodie_app/pages/login_screen.dart';
import 'package:poojagoodie_app/services/api_service.dart';

import 'channel_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Channel? _channel;
  final bool _isLoading = false;
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

  final List<String> channelIds = [
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
      drawer: buildDrawer(context),
      backgroundColor: const Color.fromARGB(255, 59, 59, 58),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.menu,
              color: orenge,
            ),
          );
        }),
        title: textWidget(text: "Home", color: Colors.orange, fontSize: 20),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
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
                      SvgPicture.asset(
                        'assets/namelogo.svg',
                        width: 200,
                      ),
                      bigspace
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: _channel != null
                      ? GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          padding: const EdgeInsets.all(20.0),
                          children: List.generate(channelIds.length, (index) {
                            return FutureBuilder(
                                future: APIService.instance.fetchChannel(
                                    channelId: channelIds[index], ''),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    Channel channel = snapshot.data;
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChannelPage(
                                                        channel: channel)));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 83, 75, 73),
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Column(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      19.0),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 25,
                                                    backgroundImage:
                                                        NetworkImage(channel
                                                            .profilePictureUrl),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Text(channel.title,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0)),
                                            const SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("Error: ${snapshot.error}");
                                  } else {
                                    return const Text('Loading...');
                                  }
                                });
                          }),
                        )
                      : const Center(
                          child: Text('Loading...'),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}

buildDrawerItem(BuildContext context,
    {required String title,
    required Function onPressed,
    Color color = grey,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
    double height = 45,
    bool isVisible = false}) {
  return SizedBox(
    height: height,
    child: ListTile(
      contentPadding: const EdgeInsets.all(0),
      // minVerticalPadding: 0,
      dense: true,
      onTap: () => onPressed(),
      title: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(
            width: 5,
          ),
          isVisible
              ? CircleAvatar(
                  backgroundColor: orenge,
                  radius: 10,
                  child: Text(
                    '1',
                    style: GoogleFonts.poppins(
                      color: bc,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    ),
  );
}

buildDrawer(BuildContext context) {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 64, 64, 64),
    child: Column(
      children: [
        SizedBox(
          height: 150,
          child: DrawerHeader(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: orenge,
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Good Morning, ',
                        style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 14)),
                    Text(
                      'namsthe ',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: orenge),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ),
              )
            ],
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              buildDrawerItem(context, title: 'Settings', onPressed: () {}),
              buildDrawerItem(context, title: 'Log Out', onPressed: () {
                googleSignIn.signOut();
                Get.offAll(LoginPage());
              }),
            ],
          ),
        ),
        const Spacer(),
        Divider(
          color: Theme.of(context).primaryColorDark,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              buildDrawerItem(context,
                  title: 'Do more',
                  onPressed: () {},
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark.withOpacity(0.15),
                  height: 20),
              const SizedBox(
                height: 20,
              ),
              buildDrawerItem(
                context,
                title: 'Rate us on store',
                onPressed: () {},
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColorDark.withOpacity(0.15),
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
