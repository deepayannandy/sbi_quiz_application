import 'package:flutter/material.dart';
import 'package:sbi_quiz_application/pages/UsersList.dart';
import 'package:sbi_quiz_application/pages/formScreen.dart';
import 'package:sbi_quiz_application/widgets/buttonStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffd6c7a6),
        body: Stack(
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage("assets/images/backbig.png"),
            //         fit: BoxFit.cover,
            //         colorFilter: ColorFilter.mode(
            //           Color.fromARGB(255, 186, 163, 78).withOpacity(0.8),
            //           BlendMode.dstATop,
            //         ),
            //       ),
            //     )),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.grey.withOpacity(0.1), BlendMode.color),
                    image: const AssetImage(
                      "assets/images/newHome.jpeg",
                    ),
                  ),
                )),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 0,
                            ),
                            // Image.asset(
                            //   "assets/images/Logo.png",
                            //   height: 100,
                            //   width: 100,
                            // ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UsersListScreen()));
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
                                  Icons.list,
                                  color: Color(0xff344054),
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Image.asset(
                      //   "assets/images/banners.png",
                      //   height: 200,
                      // ),
                      const SizedBox(
                        height: 80,
                      ),
                    ]),
              ),
            ),
            // Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Padding(
            //         padding: EdgeInsets.only(left: 40, right: 40, bottom: 200),
            //         child: Image.asset(
            //           "assets/images/question2-removebg-preview.png",
            //           width: 100,
            //           height: 100,
            //         ))),
            // Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Padding(
            //         padding: EdgeInsets.only(left: 80, right: 80, bottom: 30),
            //         child: Image.asset(
            //           "assets/images/questionimage-removebg-preview.png",
            //           width: 150,
            //           height: 200,
            //         ))),
            // Align(
            //     alignment: Alignment.bottomRight,
            //     child: Padding(
            //         padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
            //         child: Image.asset(
            //           "assets/images/questionimage-removebg-preview.png",
            //           width: 200,
            //           height: 200,
            //         ))),
            // Align(
            //     alignment: Alignment.bottomRight,
            //     child: Padding(
            //         padding: EdgeInsets.only(left: 40, right: 20, bottom: 200),
            //         child: Image.asset(
            //           "assets/images/question2-removebg-preview.png",
            //           width: 100,
            //           height: 100,
            //         ))),
            // Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Padding(
            //       padding: EdgeInsets.only(left: 80, right: 80, bottom: 220),
            //       child: Text(
            //         "Test Your Knowledge and Win!",
            //         style: TextStyle(
            //             fontSize: 30,
            //             fontWeight: FontWeight.w800,
            //             color: Colors.grey.shade800),
            //       ),
            //     )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 50),
                child: ElevatedButton(
                  style: FilledButtonStyle(),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Start Quiz",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
