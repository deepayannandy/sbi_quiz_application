import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:sbi_quiz_application/Models/users.dart';
import 'package:sbi_quiz_application/main.dart';
import 'package:sbi_quiz_application/pages/homeScreen.dart';
import 'package:sbi_quiz_application/pages/quizpage.dart';
import 'package:sbi_quiz_application/widgets/buttonStyles.dart';
import 'package:sbi_quiz_application/widgets/mobile_text_form_field.dart';
import 'package:sbi_quiz_application/widgets/PF_text_form_field.dart';
import 'package:sbi_quiz_application/widgets/name_text_form_field.dart';

const List<String> list = <String>[
  'Select your Occupation',
  'Goverment Job',
  'Business',
  'Self Employeed',
  'Private Sector',
  "Student",
];

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  GlobalKey<FormState> userFormKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController pfnumber = TextEditingController();
  double screenheight = 1200;
  Box<Users>? usersBox;
  String ocupation = "";
  @override
  void initState() {
    usersBox = Hive.box<Users>(userDataName);
    super.initState();
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
                  child: Form(
                    key: userFormKey,
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
                                          color: Colors.grey.shade300,
                                          width: 1),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Full Name",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                NameTextFormField(nameController: name),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Contact Number",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                NumberTextFormField(numberController: number),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "PF Number",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                PFTextFormField(nameController: pfnumber)
                              ],
                            ),
                          )
                        ]),
                  ))),
          Align(
              alignment: Alignment.bottomLeft,
              child: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                  ? Container()
                  : Padding(
                      padding:
                          EdgeInsets.only(left: 40, right: 40, bottom: 260),
                      child: Image.asset(
                        "assets/images/questionimage-removebg-preview.png",
                        width: 200,
                        height: 200,
                      ))),
          Align(
              alignment: Alignment.bottomRight,
              child: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                  ? Container()
                  : Padding(
                      padding:
                          EdgeInsets.only(left: 40, right: 20, bottom: 200),
                      child: Image.asset(
                        "assets/images/question2-removebg-preview.png",
                        width: 150,
                        height: 100,
                      ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 80, right: 80, bottom: 50),
              child: ElevatedButton(
                style: FilledButtonStyle(),
                onPressed: () {
                  if (userFormKey.currentState!.validate()) {
                    List<Users> user = usersBox!.values
                        .where((element) => element.pfNumber == pfnumber.text)
                        .toList();
                    if (user.length == 0) {
                      Users userdata = Users(
                          rating: 0,
                          username: name.text,
                          contact: number.text,
                          pfNumber: pfnumber.text,
                          dateandtime: DateTime.now().toString());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuizScreen(userdata: userdata)));
                    } else {
                      Fluttertoast.showToast(msg: "PF already exist");
                    }
                  }
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
                      "Save and Play",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
