import 'package:flutter/material.dart';
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';
import 'package:udemypractice/models/main_model.dart';
import 'package:udemypractice/views/passive_user_profile_page.dart';
// import 'package:udemypractice/models/main_model.dart';

import 'package:udemypractice/views/signup_page.dart';
import 'package:udemypractice/views/login_page.dart';
import 'package:udemypractice/views/account_page.dart';
import 'package:udemypractice/main.dart';

void toMainPage({required BuildContext context}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
void toSignupPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => SignupPage()));
void toLoginPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => LoginPage()));
void toAccountPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AccountPage(mainModel: mainModel)));

void toPassiveUserProfilePage(
        {required BuildContext context,
        required FirestoreUser passiveFirestoreUser,
        required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PassiveUserProfilePage(
                  passiveFirestoreUser: passiveFirestoreUser,
                  mainModel: mainModel,
                )));
