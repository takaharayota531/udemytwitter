//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/models/signup_model.dart';

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
        title: const Text("ユーザー登録ページ"),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => signupModel.email = text,
            controller: emailEditingController,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => signupModel.password = text,
            controller: passwordEditingController,
            obscureText: signupModel.isObscure,
            decoration: InputDecoration(
                suffix: InkWell(
              child: signupModel.isObscure
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )),
            onTap: () => signupModel.toggleIsObscure(),
          ),
          Center(
            child: signupModel.currentUser == null
                ? Text("登録されていません")
                : Text("Non null"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async => await signupModel.createUser(context: context)),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
