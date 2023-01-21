import 'package:flutter/foundation.dart';

//flutter
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:udemypractice/details/user_image.dart';
//domain
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';
import 'package:udemypractice/constants/strings.dart';

final signupProvider = ChangeNotifierProvider(((ref) => SignupModel()));

class SignupModel extends ChangeNotifier {
  int counter = 0;
  User? currentUser = null;
  //auth
  String email = "";
  String password = "";
  bool isObscure = true;
  //データベースに保存する用
  Future<void> createFirestoreUser(
      {required BuildContext context, required String uid}) async {
    //counter
    counter++;

    final Timestamp now = Timestamp.now();

    final FirestoreUser firestoreUser = FirestoreUser(
        createdAt: now,
        updatedAt: now,
        email: email,
        userName: "Alice",
        userImageURL: "",
        uid: uid);
    final Map<String, dynamic> userData = firestoreUser.toJson();
    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(uid)
        .set(userData);
    //画面下部にメッセージが表示される
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(userCreateMsg)));
    notifyListeners();
  }

  //auth用にユーザーを作成
  Future<void> createUser({required BuildContext context}) async {
    //firebaseのauth用
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      // final String userNanem = user!.userName;

      await createFirestoreUser(context: context, uid: uid);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
