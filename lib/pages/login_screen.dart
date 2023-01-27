import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:poojagoodie_app/Widgets/intro_widget.dart';
import 'package:poojagoodie_app/Widgets/text_widget.dart';
import 'package:poojagoodie_app/core/consts.dart';

import 'login_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final GoogleSignIn _googleSignIn = Get.find<GoogleSignIn>();
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
            children: [
              loginPageWidget(),
              Center(
                  child: textWidget(
                      text: '------------SIGN IN-------------',
                      fontWeight: FontWeight.bold)),
              loginButton()
            ],
          ),
        ),
      ),
    );
  }
}
