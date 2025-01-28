import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sbi_quiz_application/pages/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? isOnBoardingScreenLaunch;
  String? token;

  @override
  void initState() {
    _navigationToLoginScreen();
    super.initState();
  }

  _navigationToLoginScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("h${height}w$width");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: ((height / 3)),
            child: Image.asset(
              "assets/images/boxLogo.png",
              width: 400.09175,
            ),
          )
        ],
      ),
    );
  }
}
