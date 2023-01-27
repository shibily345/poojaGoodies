import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/consts.dart';
import 'home_page.dart';

class loginButton extends StatelessWidget {
  loginButton({
    Key? key,
  }) : super(key: key);
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _googleSignIn.signIn().then((value) {
                String userName = value!.displayName!;
                String profilePicture = value.photoUrl!;
                Get.offAll(() => const HomePage());
              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(10, 10),
                      color: shadowD,
                    ),
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(-10, -10),
                      color: shadowL,
                    ),
                  ]),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  'assets/search.png',
                  height: 100,
                ),
              )),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          InkWell(
            onTap: () {
              Get.snackbar('Update Soon..... ', "Still Working on it Sorry'");
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(10, 10),
                      color: shadowD,
                    ),
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(-10, -10),
                      color: shadowL,
                    ),
                  ]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(
                    'assets/whatsapp.png',
                    height: 100,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
