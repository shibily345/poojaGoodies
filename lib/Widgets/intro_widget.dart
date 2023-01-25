import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loginPageWidget() {
  return Container(
    height: Get.height * 0.7,
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/bg1.png'), fit: BoxFit.cover),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: SizedBox(
            height: 80,
            child: SvgPicture.asset(
              'assets/logo.svg',
            ),
          ),
        ),
        const SizedBox(
          height: 10,
          width: 60,
        ),
        SvgPicture.asset(
          'assets/logoname.svg',
          width: 200,
        ),
      ],
    ),
  );
}
