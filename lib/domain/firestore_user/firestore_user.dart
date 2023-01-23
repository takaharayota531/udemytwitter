import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';

@freezed
abstract class FirestoreUser with _$FirestoreUser {
  //factoryがgeneratorの機能で生成されるのではないか
  const factory FirestoreUser(
      {required dynamic createdAt,
      required dynamic updatedAt,
      required String email,
      required int followerCount,
      required int followingCount,
      required String userName,
      required String userImageURL,
      required String uid}) = _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
}
