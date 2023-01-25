import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:udemypractice/constants/routes.dart';
import 'package:udemypractice/constants/themes.dart';
import 'package:udemypractice/views/login_page.dart';
import 'package:udemypractice/views/signup_page.dart';
import 'firebase_options.dart';
//model
import 'models/main_model.dart';
import 'models/themes_model.dart';
//
import 'package:udemypractice/constants/routes.dart' as routes;
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/details/rounded_button.dart';
import 'package:udemypractice/models/sns_bottom_navigation_bar_model.dart';
import 'package:udemypractice/details/sns_bottom_navigation_bar.dart';
//components
import 'package:udemypractice/views/main/home_screen.dart';
import 'package:udemypractice/views/main/profile_screen.dart';
import 'package:udemypractice/views/main/search_screen.dart';
import 'package:udemypractice/details/sns_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //MyAppが起動したときにユーザーがいるかどうか
    final User? onceUser = FirebaseAuth.instance.currentUser;
    final ThemeModel themeModel = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      // ここでthemeが変更されている
      theme: themeModel.isDarkTheme
          ? lightThemeData(context: context)
          : darkThemeData(context: context),
      home: onceUser == null
          ? LoginPage()
          : MyHomePage(
              title: appTitle,
              themeModel: themeModel,
            ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title, required this.themeModel})
      : super(key: key);

  final String title;
  final ThemeModel themeModel;
  // final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //MainModelが起動する init()が実行される
    final MainModel mainModel = ref.watch(mainProvider);
    final SNSBottomNavigationBarModel snsBottomNavigationBarModel =
        ref.watch(SNSBottomNavigationBarProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: SNSDrawer(
        mainModel: mainModel,
        themeModel: themeModel,
      ),
      body: (mainModel.isLoading == true)
          ? const Center(
              child: const Text(loadingMsg),
            )
          : PageView(
              controller: snsBottomNavigationBarModel.pageController,
              onPageChanged: (index) =>
                  snsBottomNavigationBarModel.onPageChanged(index: index),
              children: [
                HomeScreen(),
                SearchScreen(
                  mainModel: mainModel,
                ),
                ProfileScreen(mainModel: mainModel),
              ],
            ),
      bottomNavigationBar: SNSBottomNavigationBar(
          snsBottomNavigationBarModel: snsBottomNavigationBarModel),
    );
  }
}
