import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sbi_quiz_application/Models/users.dart';
import 'package:sbi_quiz_application/Questions/questions.dart';
import 'package:sbi_quiz_application/pages/ReasultsPage.dart';
import 'package:sbi_quiz_application/pages/homeScreen.dart';
import 'package:sbi_quiz_application/widgets/buttonStyles.dart';

class QuizScreen extends StatefulWidget {
  final Users userdata;
  const QuizScreen({Key? key, required this.userdata}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  Random random = new Random();
  NumberFormat formatter = new NumberFormat("00");
  int questionCount = 1;
  String Selectedanswer = "";
  int _start = 90;
  Timer? _timer;
  questions? askedquestion;
  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              setState(() {
                _start = _start - 1;
              });
            }
          },
        ),
      );
    }
  }

  void fetchQuestion() {
    if (questionCount < 3) {
      setState(() {
        askedquestion = comQuestions[questionCount - 1];
      });
    } else {
      setState(() {
        askedquestion = normalQuestions[random.nextInt(normalQuestions.length)];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    fetchQuestion();
    print(normalQuestions.length);
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          children: [
                            const SizedBox(
                              width: 0,
                            ),
                            Image.asset(
                              "assets/images/Logo.png",
                              height: 100,
                              width: 100,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              },
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.shade300, width: 1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Icon(
                                  Icons.close,
                                  color: Color(0xff344054),
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xffd3eaf2),
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(children: [
                                  Text(
                                    "Participant Name ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Timer",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ]),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(children: [
                                  Text(
                                    widget.userdata.username,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${formatter.format((_start / 60).toInt())} : ${formatter.format(_start % 60)} ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Color(0xffd3eaf2),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Question",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${questionCount}/10",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      askedquestion!.question!,
                                      textAlign: TextAlign.left,
                                      maxLines: 4,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            answersCard(askedquestion!.a!),
                            answersCard(askedquestion!.b!)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            answersCard(askedquestion!.c!),
                            answersCard(askedquestion!.d!)
                          ],
                        )
                      ]))),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: Container(
                width: 200,
                child: ElevatedButton(
                  style: FilledButtonStyle(),
                  onPressed: () {
                    if (questionCount < 10) {
                      questionCount = questionCount + 1;
                      print("${askedquestion!.answer} - ${Selectedanswer}");
                      if (askedquestion!.answer == Selectedanswer) {
                        score = score + 1;
                      }
                      Selectedanswer = "";
                      fetchQuestion();
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReasultsScreen(
                                    score: score,
                                    userdata: widget.userdata,
                                  )));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        questionCount > 9 ? "Submit" : "Next",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      questionCount < 10
                          ? Icon(
                              Icons.skip_next_rounded,
                              size: 30,
                            )
                          : Container(
                              height: 56,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _start == 0
                ? Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(.5),
                    child: Text(
                      "Times Up",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  )
                : Container(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: Container(
                width: 200,
                child: ElevatedButton(
                  style: HollowButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReasultsScreen(
                                  userdata: widget.userdata,
                                  score: score,
                                )));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Finish",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.close_outlined,
                        color: Colors.red,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  answersCard(String answer) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Selectedanswer = answer;
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width / 2 - 30,
          height: 100,
          decoration: BoxDecoration(
              color: Color(Selectedanswer == answer ? 0xff7cd89b : 0xffd3eaf2),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                answer,
                textAlign: TextAlign.left,
                maxLines: 2,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ))),
    );
  }
}
