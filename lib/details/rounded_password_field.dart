import 'package:flutter/material.dart';
import 'text_field_container.dart';

import 'package:udemypractice/constants/strings.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key? key,
    // required this.keyboardType,
    required this.onChanged,
    required this.obscureText,
    required this.passwordEditingController,
    required this.toggleObscureText,
    required this.color,
    required this.borderColor,
    required this.shadowColor,
    required this.hintText,
  }) : super(key: key);
  // final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? passwordEditingController;
  final bool obscureText;
  final void Function()? toggleObscureText;

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
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChanged,
        controller: passwordEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: passwordText,
            hintStyle: TextStyle(fontWeight: FontWeight.bold),
            suffix: InkWell(
              child: obscureText
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )),
        onTap: () => toggleObscureText,
      ),
    );
  }
}
