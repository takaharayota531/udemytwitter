import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

//flutter
import 'package:flutter/material.dart';
//oackages
// import 'package:uuid/uuid_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//domain

final mainProvider = ChangeNotifierProvider(((ref) => MainModel()));

class MainModel extends ChangeNotifier {
  int counter = 0;
  User? currentUser = null;

  //ログインしているユーザーの断定
  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
}
