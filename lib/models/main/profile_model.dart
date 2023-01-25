//flutter
import 'dart:io';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
//constants
import 'package:udemypractice/constants/others.dart';
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';
import 'package:udemypractice/domain/following_token/following_token.dart';
import 'package:udemypractice/models/main_model.dart';

final profileProvider = ChangeNotifierProvider((((ref) => ProfileModel())));

class ProfileModel extends ChangeNotifier {
  File? croppedFile = null;
  // Image? xFile;

  // Future<void> pickImage() async {
  //   xFile = await returnXFile();
  // }

  Future<String> uploadImageAndGetURL(
      {required String uid, required File file}) async {
    final String fileName = returnJpgFileName();
    // users/uid/fileName にアップロード
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child("users")
        .child(uid)
        .child(fileName);
    await storageRef.putFile(file);
    //URLを取得
    return await storageRef.getDownloadURL();
  }

  Future<void> uploadUserImage(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc}) async {
    // スマホ上から探してくる作業
    final XFile xFile = await returnXFile();
    final File file = File(xFile.path); //スマホ端末上のどこにあるかのpath
    croppedFile = await returnCroppedFile(xFile: xFile);
    //現在のuserを探している
    final String uid = currentUserDoc.id;
    //どこに保存されたかをのURLを取得してくれている
    final String url = await uploadImageAndGetURL(uid: uid, file: file);
    //database上の情報を更新している
    await currentUserDoc.reference.update({
      'userImageURL': url,
    });
//xfileの変更を通知する必要がある
    notifyListeners();
  }
}
