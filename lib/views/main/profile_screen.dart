import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:udemypractice/constants/doubles.dart';
//constants
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/details/rounded_button.dart';
//components
import 'package:udemypractice/details/user_image.dart';
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';
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
    final FirestoreUser firestoreUser = mainModel.firestoreUser;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        profileModel.croppedFile == null
            ? UserImage(
                imageLength: imageLength,
                userImageURL: firestoreUser.userImageURL,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.file(
                  profileModel.croppedFile!,
                  fit: BoxFit.fill,
                ),
              ),
        Text(
          nowFollowing + firestoreUser.followingCount.toString(),
          style: TextStyle(fontSize: FOLLOW_FONT_SIZE),
        ),
        Text(
          numOfFollowers + firestoreUser.followerCount.toString(),
          style: TextStyle(fontSize: FOLLOW_FONT_SIZE),
        ),
        RoundedButton(
            onPressed: () async => await profileModel.uploadUserImage(
                currentUserDoc: mainModel.currentUserDoc),
            widthRate: 0.85,
            color: Colors.green,
            text: uploadText),
        SizedBox(height: 32.0),
        ElevatedButton(
            onPressed: () => {print(profileModel.croppedFile == null)},
            child: Text("デバッグ"))
      ],
    );
  }
}
