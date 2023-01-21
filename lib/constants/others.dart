//intとかString以外のものをreturnする
//package
// import 'dart:io';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

Future<XFile> returnXFile() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  // !を使うことにより型がちゃんとした型に変換される
  return image!;
}

// Future<Image> returnImageFile() async {
//   // Image? image = await ImagePickerWeb.getImageAsWidget();
//   // return image!;
//   // html.File? imageFile = await ImagePickerWeb.getMultiImagesAsFile();
//   // return imageFile!;
// }
