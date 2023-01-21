import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

//flutter
import 'package:flutter/material.dart';
//oackages
// import 'package:uuid/uuid_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//constants
import 'package:udemypractice/constants/routes.dart' as routes;
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';
import 'package:udemypractice/main.dart';

import '../constants/strings.dart';

//domain

final mainProvider = ChangeNotifierProvider(((ref) => MainModel()));

class MainModel extends ChangeNotifier {
  bool isLoading = false;
  int counter = 0;
  User? currentUser = null;
  late DocumentSnapshot<Map<String, dynamic>> currentUserDoc;
  late FirestoreUser firestoreUser;
  //main modelの起動処理 ユーザーの動作を必要としない
  MainModel() {
    init();
  }

  //ログインしているユーザーの断定
  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> init() async {
    startLoading();
    currentUser = FirebaseAuth.instance.currentUser;
    currentUserDoc = await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(currentUser!.uid)
        .get();
    firestoreUser = FirestoreUser.fromJson(currentUserDoc.data()!);

    notifyListeners();
    //current userのidが取得可能になった
    endLoading();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    setCurrentUser(); //nullなはず
    routes.toLoginPage(context: context);
    // notifyListeners();
  }
}
