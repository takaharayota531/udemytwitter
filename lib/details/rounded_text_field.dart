import 'package:flutter/material.dart';
import 'text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.keyboardType,
    required this.onChanged,
    required this.controller,
    required this.color,
    required this.borderColor,
    required this.shadowColor,
    required this.hintText,
  }) : super(key: key);
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  final Color color;
  final Color borderColor;
  final Color shadowColor;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        color: color,
        shadowColor: shadowColor,
        borderColor: borderColor,
        child: TextFormField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontWeight: FontWeight.bold)),
          controller: controller,
        ));
  }
}
