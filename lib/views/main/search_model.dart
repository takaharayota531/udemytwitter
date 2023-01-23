//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';

final searchProvider = ChangeNotifierProvider((((ref) => SearchModel())));

class SearchModel extends ChangeNotifier {
  List<FirestoreUser> users = [];
  SearchModel() {
    init();
  }
  Future<void> init() async {
    final QuerySnapshot<Map<String, dynamic>> qshot =
        await FirebaseFirestore.instance.collection(usersFieldKey).get();
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;

    users = docs.map((e) => FirestoreUser.fromJson(e.data()!)).toList();
    notifyListeners();
  }
}
