//flutter
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/models/signup_model.dart';
//components
import 'package:udemypractice/details/rounded_text_field.dart';
import 'package:udemypractice/details/rounded_password_field.dart';
import 'package:udemypractice/details/rounded_button.dart';
import 'package:udemypractice/constants/strings.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignupModel signupModel = ref.watch(signupProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: signupModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: signupModel.password);

    return Scaffold(
      appBar: AppBar(
        title: const Text(signupTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => signupModel.email = text,
            controller: emailEditingController,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.purple,
            hintText: mailAddressText,
          ),
          RoundedPasswordField(
            onChanged: (text) => signupModel.password = text,
            obscureText: signupModel.isObscure,
            passwordEditingController: passwordEditingController,
            toggleObscureText: (() => signupModel.toggleIsObscure()),
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.purple,
            hintText: passwordText,
          ),
          RoundedButton(
              onPressed: (() async =>
                  await signupModel.createUser(context: context)),
              widthRate: 0.3,
              color: Colors.green,
              text: signupText),
        ],
      ),
      // floatingActionButton: FloatingActionButton(

      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
