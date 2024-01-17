import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sbi_quiz_application/Models/users.dart';
import 'package:sbi_quiz_application/pages/homeScreen.dart';
import 'package:sbi_quiz_application/widgets/buttonStyles.dart';
import 'package:hive/hive.dart';

import '../main.dart';

final controller = ConfettiController();

class ReasultsScreen extends StatefulWidget {
  final int score;
  final Users userdata;
  const ReasultsScreen({Key? key, required this.score, required this.userdata})
      : super(key: key);

  @override
  State<ReasultsScreen> createState() => _ReasultsScreenState();
}

class _ReasultsScreenState extends State<ReasultsScreen> {
  bool isplaying = false;
  bool isRated = false;
  int rate = 0;
  Box<Users>? usersBox;
  @override
  void initState() {
    super.initState();
    if (widget.score > 7) congrats();
    usersBox = Hive.box<Users>(userDataName);
  }

  congrats() async {
    controller.play();
    await Future.delayed(Duration(milliseconds: 2000), () {});
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/backbig.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8),
                    BlendMode.dstATop,
                  ),
                ),
              )),
          SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        Image.asset(
                          widget.score > 7
                              ? "assets/images/congDotted.gif"
                              : "assets/images/thankDotted.gif",
                          width: MediaQuery.of(context).size.width / .8,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          isRated == false
                              ? "Rate your experience with SBI"
                              : "Thank you for your valuable feedback",
                          style: TextStyle(
                              color: Color(0xff1D2939),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: isRated == false
                                ? [
                                    rateCard("assets/images/1.png", 1),
                                    rateCard("assets/images/2.png", 2),
                                    rateCard("assets/images/3.png", 3),
                                    rateCard("assets/images/4.png", 4),
                                    rateCard("assets/images/5.png", 5),
                                  ]
                                : [
                                    rateCard("assets/images/$rate.png", 1),
                                  ],
                          ),
                        )
                      ]))),
          Align(
            alignment: Alignment.bottomCenter,
            child: isRated == false
                ? Container()
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 80, right: 80, bottom: 100),
                    child: ElevatedButton(
                      style: FilledButtonStyle(),
                      onPressed: () async {
                        usersBox!.add(widget.userdata);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Start Again",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  "assets/images/Logo.png",
                  height: 300,
                  width: 300,
                ),
              )),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ConfettiWidget(
                  confettiController: controller,
                  blastDirection: pi / 2,
                  gravity: 0.2,
                  emissionFrequency: .2,
                  maximumSize: Size(30, 20),
                  blastDirectionality: BlastDirectionality.explosive,
                ),
              ))
        ],
      ),
    );
  }

  rateCard(String Imagepath, int rateval) {
    return TextButton(
        onPressed: () {
          isRated = true;
          rate = rateval;
          widget.userdata.rating = rateval;
          setState(() {});
        },
        child: Image.asset(
          Imagepath,
          width: MediaQuery.of(context).size.width / 6 - 30,
        ));
  }
}
