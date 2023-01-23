import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
part 'following_token.freezed.dart';
part 'following_token.g.dart';

@freezed
abstract class FollowingToken with _$FollowingToken {
  //factoryがgeneratorの機能で生成されるのではないか
  // databaseに保存するidが必要
  const factory FollowingToken({
    required dynamic createdAt,
    required String passiveUid,
    required String tokenId,
  }) = _FollowingToken;

  factory FollowingToken.fromJson(Map<String, dynamic> json) =>
      _$FollowingTokenFromJson(json);
}
