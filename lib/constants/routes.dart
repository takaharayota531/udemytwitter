import 'package:flutter/material.dart';
import 'package:udemypractice/models/main_model.dart';

import 'package:udemypractice/views/signup_page.dart';
import 'package:udemypractice/views/login_page.dart';
import 'package:udemypractice/main.dart';

void toMainPage({required BuildContext context}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
void toSignupPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => SignupPage()));
void toLoginPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(mainModel: mainModel)));
