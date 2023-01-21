import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/details/rounded_button.dart';
//components
import 'package:udemypractice/details/user_image.dart';
import 'package:udemypractice/models/main/profile_model.dart';
//models
import 'package:udemypractice/models/main_model.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({
    Key? key,
    required this.mainModel,
  }) : super(key: key);

  final MainModel mainModel;
  final double fontSize = 50;
  final double imageLength = 50;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileModel profileModel = ref.watch(profileProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileModel.xFile == null
            ? Container(
                alignment: Alignment.center,
                child: UserImage(
                  imageLength: imageLength,
                  userImageURL: mainModel.firestoreUser.userImageURL,
                ),
              )
            : Text("Loading"),
        RoundedButton(
            onPressed: () async => await profileModel.uploadUserImage(
                currentUserDoc: mainModel.currentUserDoc),
            widthRate: 0.85,
            color: Colors.green,
            text: "Upload"),
      ],
    );
  }
}
