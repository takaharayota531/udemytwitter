import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';
import 'package:udemypractice/details/rounded_button.dart';
import 'package:udemypractice/models/main/profile_model.dart';
import 'package:udemypractice/models/main_model.dart';
import 'package:udemypractice/models/passive_user_profile_model.dart';
import 'package:udemypractice/constants/doubles.dart';
import 'package:udemypractice/details/user_image.dart';

class PassiveUserProfilePage extends ConsumerWidget {
  PassiveUserProfilePage({
    Key? key,
    required this.passiveFirestoreUser,
    required this.mainModel,
  }) : super(key: key);

  final FirestoreUser passiveFirestoreUser;
  final MainModel mainModel;
  final double imageLength = 50;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);
    final int followerCount = passiveFirestoreUser.followerCount;
    final int plusOneFollowerCount = passiveFirestoreUser.followerCount + 1;
    final bool isFollowing =
        mainModel.followingUids.contains(passiveFirestoreUser.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text(passiveFirestoreUser.userName + profileTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserImage(
            imageLength: imageLength,
            userImageURL: passiveFirestoreUser.userImageURL,
          ),
          Center(
            child: Text(passiveFirestoreUser.uid),
          ),
          Center(
            child: Text(passiveFirestoreUser.userName),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            child: Text(
              nowFollowing + passiveFirestoreUser.followingCount.toString(),
              style: TextStyle(fontSize: FOLLOW_FONT_SIZE),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              isFollowing
                  ? numOfFollowers + plusOneFollowerCount.toString()
                  : numOfFollowers + followerCount.toString(),
              style: TextStyle(fontSize: FOLLOW_FONT_SIZE),
            ),
          ),
          isFollowing
              ? RoundedButton(
                  onPressed: () => passiveUserProfileModel.unfollow(
                      mainModel: mainModel,
                      passiveFirestoreUser: passiveFirestoreUser),
                  widthRate: 0.85,
                  color: Colors.red,
                  text: unfollowText)
              : RoundedButton(
                  onPressed: () => passiveUserProfileModel.follow(
                      mainModel: mainModel,
                      passiveFirestoreUser: passiveFirestoreUser),
                  widthRate: 0.85,
                  color: Colors.green,
                  text: followText),
        ],
      ),
    );
  }
}
