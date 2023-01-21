import 'package:flutter/material.dart';
import 'package:udemypractice/details/circle_image.dart';

class UserImage extends StatelessWidget {
  UserImage({
    Key? key,
    required this.imageLength,
    required this.userImageURL,
  }) : super(key: key);

  final double imageLength;
  final String userImageURL;

  @override
  Widget build(BuildContext context) {
    // 与えられたUserImageが空の時に表示するもの

    return userImageURL.isEmpty
        ? Container(
            width: imageLength,
            height: imageLength,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: imageLength,
            ),
          )
        : CircleImage(
            imageLength: imageLength, image: NetworkImage(userImageURL));
  }
}
