import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sbi_quiz_application/Models/users.dart';
import 'package:sbi_quiz_application/pages/splash_screen.dart';

const String userDataName = "Users";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>(userDataName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SBI',
      theme: ThemeData(
        fontFamily: "Inter",
        primaryColor: const Color(0xFF11A8FD),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xffEDEDF0),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
