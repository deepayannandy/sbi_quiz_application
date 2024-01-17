import 'dart:io';

import 'package:excel/excel.dart' as exel;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:sbi_quiz_application/Models/users.dart';
import 'package:sbi_quiz_application/main.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  List<Users> userslist = [];
  Box<Users>? usersBox;
  @override
  void initState() {
    usersBox = Hive.box<Users>(userDataName);
    super.initState();
  }

  exportToExel() async {
    String filename =
        "exported_data_${DateTime.now().toString().replaceAll(" ", "_")}.xlsx";
    final excel = exel.Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet()];
    sheet!
        .cell(exel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
        .value = exel.TextCellValue("Participant Name");
    sheet
        .cell(exel.CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0))
        .value = exel.TextCellValue(
      "Contact Number",
    );
    sheet
        .cell(exel.CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0))
        .value = exel.TextCellValue("Occupation");
    sheet
        .cell(exel.CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0))
        .value = exel.TextCellValue("Rating");
    for (int i = 0; i < usersBox!.length; i++) {
      Users user = usersBox!.getAt(i)!;
      sheet
          .cell(
              exel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1))
          .value = exel.TextCellValue(user.username);
      sheet
          .cell(
              exel.CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1))
          .value = exel.TextCellValue(
        user.contact,
      );
      sheet
          .cell(
              exel.CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1))
          .value = exel.TextCellValue(user.occupation);
      sheet
          .cell(
              exel.CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 1))
          .value = exel.TextCellValue(user.rating.toString());
    }
    excel.save(fileName: filename);
    var fileBytes = excel.save();
    var directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    final file = File(p.join('${directory.path}/$filename'))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
    openFile(file);
  }

  static Future openFile(File file) async {
    final url = file.path;
    print(file.path.toString());
    await OpenFilex.open(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xff344054),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Participants Details",
                      style: TextStyle(
                          color: Color(0xff1D2939),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 68,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text("${usersBox!.length}"),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        exportToExel();
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.download_rounded,
                          color: Color.fromARGB(255, 5, 133, 24),
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            title: const Text('Delete Data'),
                            content: const Text(
                                'Are you sure you want to Delete all the collected Details!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  usersBox!.clear();
                                  setState(() {});
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 175, 8, 8),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      itemCount: usersBox!.length,
                      itemBuilder: ((context, index) {
                        return UsersCard(usersBox!.getAt(index)!);
                      })),
                )
              ])),
    );
  }

  UsersCard(Users user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black45),
              color: Color.fromARGB(255, 236, 246, 249),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/${user.rating}.png",
                    height: 60,
                    width: 60,
                  ),
                  Spacer(),
                  Text(
                    user.username,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Text(
                    user.contact,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Text(
                    user.occupation,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ))),
    );
  }
}
