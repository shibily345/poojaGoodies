import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:poojagoodie_app/Widgets/intro_widget.dart';
import 'package:poojagoodie_app/core/consts.dart';
import 'package:poojagoodie_app/Widgets/text_widget.dart';
import 'package:poojagoodie_app/pages/home_page.dart';
import 'package:poojagoodie_app/pages/test_home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  GoogleSignIn _googleSignIn = Get.find<GoogleSignIn>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgc,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [loginPageWidget(), loginButton()],
          ),
        ),
      ),
    );
  }
}

class loginButton extends StatelessWidget {
  loginButton({
    Key? key,
  }) : super(key: key);
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: InkWell(
              onTap: () {
                _googleSignIn.signIn().then((value) {
                  String userName = value!.displayName!;
                  String profilePicture = value.photoUrl!;
                  Get.offAll(() => HomePage());
                });
              },
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: bgc,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(10, 10),
                        color: shadowD,
                      ),
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(-10, -10),
                        color: shadowL,
                      ),
                    ]),
                child: Center(child: textWidget(text: 'Login Via Google')),
              ),
            ),
          ),
          bigspace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: InkWell(
              onTap: () {
                Get.offAll(() => testHome());
              },
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: bgc,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(10, 10),
                        color: shadowD,
                      ),
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(-10, -10),
                        color: shadowL,
                      ),
                    ]),
                child: Center(child: textWidget(text: 'Login Via Watsapp')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
