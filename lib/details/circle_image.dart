import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.imageLength,
    required this.image,
  }) : super(key: key);

  final double imageLength;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageLength,
      height: imageLength,
      decoration: BoxDecoration(
        image: DecorationImage(image: image),
      ),
    );
  }
}
