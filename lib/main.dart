import 'package:flutter/material.dart';

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
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainModel.currentUser == null
          ? LoginPage(mainModel: mainModel)
          : MyHomePage(title: appTitle, mainModel: mainModel),
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
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
                onPressed: () => routes.toSignupPage(context: context),
                widthRate: 0.3,
                color: Colors.green,
                text: signupText),
            RoundedButton(
                onPressed: () =>
                    routes.toLoginPage(context: context, mainModel: mainModel),
                widthRate: 0.3,
                color: Colors.green,
                text: loginText),
          ],
        ),
      ),
    );
  }
}
