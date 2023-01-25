//flutter
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/models/main_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//constants
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';
import 'package:udemypractice/domain/following_token/following_token.dart';
import 'package:udemypractice/models/main_model.dart';
import 'package:udemypractice/domain/follower/follower.dart';
import 'package:udemypractice/constants/strings.dart';

final passiveUserProfileProvider =
    ChangeNotifierProvider((((ref) => PassiveUserProfileModel())));

class PassiveUserProfileModel extends ChangeNotifier {
  // follow関係の構築
  Future<void> follow(
      {required MainModel mainModel,
      required FirestoreUser passiveFirestoreUser}) async {
    mainModel.followingUids.add(passiveFirestoreUser.uid);
    final Timestamp now = Timestamp.now();
    final String tokenId = returnUuidV4();
    final FollowingToken followingToken = FollowingToken(
        createdAt: now, passiveUid: passiveFirestoreUser.uid, tokenId: tokenId);
    final FirestoreUser activeUser = mainModel.firestoreUser;

    //危険な例
    final newActiveUser = activeUser.copyWith(
      followingCount: activeUser.followingCount + 1,
    );
    final FirestoreUser newPassiveFirestoreUser = passiveFirestoreUser.copyWith(
      followerCount: passiveFirestoreUser.followerCount + 1,
    );
    //folowerが増えた状態で
    mainModel.firestoreUser = newActiveUser;
    // データベースへの処理を待っているのでは遅いから
    notifyListeners();
    // 自分がフォローしたことの印

    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(activeUser.uid)
        .collection(tokens)
        .doc(tokenId)
        .set(followingToken.toJson());

    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(activeUser.uid)
        .update(newActiveUser.toJson());
    // 受動的なユーザーがフォローされたデータを生成する
    final Follower follower = Follower(
        createdAt: now,
        followedUid: passiveFirestoreUser.uid,
        followerUid: activeUser.uid);

    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(passiveFirestoreUser.uid)
        .collection(usersFollowersKey)
        .doc(activeUser.uid)
        .set(follower.toJson());
    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(passiveFirestoreUser.uid)
        .update(newPassiveFirestoreUser.toJson());
  }

  Future<void> unfollow(
      {required MainModel mainModel,
      required FirestoreUser passiveFirestoreUser}) async {
    mainModel.followingUids.remove(passiveFirestoreUser.uid);
    final FirestoreUser activeUser = mainModel.firestoreUser;
    final newActiveUser = activeUser.copyWith(
      followingCount: activeUser.followingCount - 1,
    );
    final FirestoreUser newPassiveFirestoreUser = passiveFirestoreUser.copyWith(
      followerCount: passiveFirestoreUser.followerCount - 1,
    );
    notifyListeners();
    // followしているtokenを取得する

    // これ複数扱い qshotというdataの塊の存在を取得
    final qshot = await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(activeUser.uid)
        .collection(tokens)
        .where(PASSIVE_UID, isEqualTo: passiveFirestoreUser.uid)
        .get();
    // 一つしかデータは取得していないはず
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token = docs.first;
    // pathを削除
    await token.reference.delete();
    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(activeUser.uid)
        .update(newActiveUser.toJson());
    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(passiveFirestoreUser.uid)
        .collection(usersFollowersKey)
        .doc(activeUser.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(passiveFirestoreUser.uid)
        .update(newPassiveFirestoreUser.toJson());
  }
}
