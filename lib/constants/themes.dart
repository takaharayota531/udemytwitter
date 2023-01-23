//flutter
import 'package:flutter/material.dart';

// shared prefrences: boolを保存できる
ThemeData lightThemeData({required BuildContext context}) {
  // copy with中身をちょいちょい変えるよ
  return ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );
}

ThemeData darkThemeData({required BuildContext context}) {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
  );
}
