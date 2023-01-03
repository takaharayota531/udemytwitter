import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

//flutter
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//domain
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';

//constants
import 'package:udemypractice/constants/routes.dart' as routes;
import 'package:udemypractice/models/main_model.dart';

final loginProvider = ChangeNotifierProvider(((ref) => LoginModel()));

class LoginModel extends ChangeNotifier {
  //auth
  String email = "";
  String password = "";
  bool isObscure = true;

  //auth用にユーザーを作成
  Future<void> login(
      {required BuildContext context, required MainModel mainModel}) async {
    try {
      //firebaseのauth用

      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      routes.toMainPage(context: context);
      mainModel.setCurrentUser();

      // .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
