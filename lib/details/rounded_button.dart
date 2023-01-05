import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.widthRate,
    required this.color,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;

  final double widthRate;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
        width: maxWidth * widthRate,
        color: color,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Text("ボタン"),
            ),
            style: ElevatedButton.styleFrom(
              primary: color,
            ),
          ),
        ));
  }
}
