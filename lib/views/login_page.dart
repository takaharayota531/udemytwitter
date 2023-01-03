//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/models/login_model.dart';
import 'package:udemypractice/models/main_model.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key, required MainModel this.mainModel}) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: loginModel.password);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ログインページ"),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            controller: emailEditingController,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => loginModel.password = text,
            controller: passwordEditingController,
            obscureText: loginModel.isObscure,
            decoration: InputDecoration(
                suffix: InkWell(
              child: loginModel.isObscure
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )),
            onTap: () => loginModel.toggleIsObscure(),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() async => await loginModel.login()),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: (() async =>
            await loginModel.login(context: context, mainModel: mainModel)),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
