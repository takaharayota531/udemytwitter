import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:udemypractice/constants/routes.dart';
import 'package:udemypractice/views/login_page.dart';
import 'package:udemypractice/views/signup_page.dart';
import 'firebase_options.dart';
import 'models/main_model.dart';
import 'package:udemypractice/constants/routes.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainModel.currentUser == null
          ? LoginPage(mainModel: mainModel)
          : MyHomePage(title: 'Flutter Demo Home Page', mainModel: mainModel),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage(
      {Key? key, required this.title, required MainModel this.mainModel})
      : super(key: key);

  final String title;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("mainPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () => routes.toSignupPage(context: context),
              child: const Text("登録画面")),
          ElevatedButton(
              onPressed: () =>
                  routes.toLoginPage(context: context, mainModel: mainModel),
              child: const Text("ログイン画面")),
        ],
      ),
    );
  }
}
