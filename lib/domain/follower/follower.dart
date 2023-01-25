import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
part 'follower.freezed.dart';
part 'follower.g.dart';

@freezed
abstract class Follower with _$Follower {
  //factoryがgeneratorの機能で生成されるのではないか
  // databaseに保存するidが必要
  // 自分がフォローしたことのしるし
  const factory Follower({
    required dynamic createdAt,
    required String followedUid,
    required String followerUid,
  }) = _Follower;

  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);
}
