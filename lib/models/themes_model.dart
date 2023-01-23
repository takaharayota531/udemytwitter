//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
//constants
import 'package:udemypractice/constants/strings.dart';

final themeProvider = ChangeNotifierProvider((((ref) => ThemeModel())));

class ThemeModel extends ChangeNotifier {
  bool isDarkTheme = true;
  late SharedPreferences preferences;

  //初期化処理
  ThemeModel() {
    init();
  }

  Future<void> init() async {
    // 端末に保存されている情報
    preferences = await SharedPreferences.getInstance();
    final x = preferences.getBool(IS_DARK_THEME)!;
    if (x != null) isDarkTheme = x;
    notifyListeners();
  }

  Future<void> setIsDarkTheme({required bool value}) async {
    isDarkTheme = value;
    await preferences.setBool(IS_DARK_THEME, value);
    notifyListeners();
  }
}
