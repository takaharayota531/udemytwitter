import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:udemypractice/constants/routes.dart';
import 'package:udemypractice/views/login_page.dart';
import 'package:udemypractice/views/signup_page.dart';
import 'firebase_options.dart';
import 'models/main_model.dart';
import 'package:udemypractice/constants/routes.dart' as routes;
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/details/rounded_button.dart';
import 'package:udemypractice/models/sns_bottom_navigation_bar_model.dart';
import 'package:udemypractice/details/sns_bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MyAppが起動したときにユーザーがいるかどうか
    final User? onceUser = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onceUser == null ? LoginPage() : MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
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
      body: (mainModel.isLoading == true)
          ? const Center(
              child: const Text(loadingMsg),
            )
          : PageView(
              controller: snsBottomNavigationBarModel.pageController,
              onPageChanged: (index) =>
                  snsBottomNavigationBarModel.onPageChanged(index: index),
              children: [
                Container(
                  child: Text(homeText),
                ),
                Container(
                  child: Text(searchText),
                ),
                Container(
                  child: Text(profileText),
                ),
              ],
            ),
      bottomNavigationBar: SNSBottomNavigationBar(
          snsBottomNavigationBarModel: snsBottomNavigationBarModel),
    );
  }
}
