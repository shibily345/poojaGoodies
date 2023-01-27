import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:poojagoodie_app/pages/home_page.dart';
import 'package:poojagoodie_app/pages/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  bool _hasLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/splashlogo.png',
            height: 100,
          ),
        ),
      ),
    );
  }

  _checkIfLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    _hasLoggedIn = prefs.getBool('hasLoggedIn') ?? false;
    if (_hasLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAll(LoginPage());
  }
}
