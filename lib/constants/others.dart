//intとかString以外のものをreturnする
//package
// import 'dart:io';
import 'dart:io';
import 'package:udemypractice/constants/strings.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:flutter/material.dart';

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

Future<File?> returnCroppedFile({required XFile? xFile}) async {
  final instance = ImageCropper();
  //
  final File? result = await instance.cropImage(
      sourcePath: xFile!.path,
      aspectRatioPresets: Platform.isAndroid
          ? [CropAspectRatioPreset.square]
          : [CropAspectRatioPreset.square],
      androidUiSettings: const AndroidUiSettings(
          toolbarTitle: cropperTitle,
          toolbarColor: Colors.green,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false),
      iosUiSettings: const IOSUiSettings(
        title: cropperTitle,
      ));
  return result;
}
