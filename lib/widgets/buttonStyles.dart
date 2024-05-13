import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
FilledButtonStyle() {
  return ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 18.0,
          color: Color.fromARGB(255, 112, 112, 112),
          fontWeight: FontWeight.bold),
      minimumSize: const Size.fromHeight(66.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Color(0xff0867df),
      shadowColor: Colors.white);
}

// ignore: non_constant_identifier_names
HollowButtonStyle() {
  return ElevatedButton.styleFrom(
    textStyle: const TextStyle(
        fontSize: 18.0, color: Color(0xff667085), fontWeight: FontWeight.bold),
    minimumSize: const Size.fromHeight(66.0),
    side: const BorderSide(
      width: 1.0,
      color: Color(0xffD0D5DD),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    backgroundColor: const Color(0xffF2F4F7),
  );
}

deleteButtonStyle() {
  return ElevatedButton.styleFrom(
    textStyle: const TextStyle(
        fontSize: 18.0, color: Color(0xff667085), fontWeight: FontWeight.bold),
    minimumSize: const Size.fromHeight(56.0),
    side: const BorderSide(
      width: 1.0,
      color: Color(0xFFFECDCA),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    backgroundColor: const Color(0xFFFFFFFF),
  );
}

editButtonStyle() {
  return ElevatedButton.styleFrom(
    textStyle: const TextStyle(
        fontSize: 18.0, color: Color(0xff667085), fontWeight: FontWeight.bold),
    minimumSize: const Size.fromHeight(56.0),
    side: const BorderSide(
      width: 1.0,
      color: Color(0xffD0D5DD),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    backgroundColor: const Color(0xFFFFFFFF),
  );
}

addDeviceButtonStyle() {
  return ElevatedButton.styleFrom(
    textStyle: const TextStyle(
        fontSize: 18.0, color: Color(0xff667085), fontWeight: FontWeight.bold),
    minimumSize: const Size.fromHeight(56.0),
    side: const BorderSide(
      width: 1.0,
      color: Color(0xFFB2CCFF),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    backgroundColor: const Color(0xFFEFF4FF),
  );
}
