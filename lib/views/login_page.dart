//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/models/login_model.dart';
import 'package:udemypractice/models/main_model.dart';
import 'package:udemypractice/details/rounded_text_field.dart';
import 'package:udemypractice/details/rounded_password_field.dart';
import 'package:udemypractice/details/rounded_button.dart';
import 'package:udemypractice/constants/strings.dart';
//routes
import 'package:udemypractice/constants/routes.dart' as routes;

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);
  // final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: loginModel.password);

    return Scaffold(
      appBar: AppBar(
        title: const Text(loginTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            controller: emailEditingController,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.red,
            hintText: mailAddressText,
          ),
          RoundedPasswordField(
            onChanged: (text) => loginModel.password = text,
            obscureText: loginModel.isObscure,
            passwordEditingController: passwordEditingController,
            toggleObscureText: (() => loginModel.toggleIsObscure()),
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.blue,
            hintText: passwordText,
          ),
          RoundedButton(
              onPressed: (() async => await loginModel.login(context: context)),
              widthRate: 0.3,
              color: Colors.green,
              text: loginText),
          TextButton(
              onPressed: () {
                routes.toSignupPage(context: context);
              },
              child: const Text(IF_YOU_DONT_HAVE_AN_ACCOUNT)),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() async => await loginModel.login()),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
