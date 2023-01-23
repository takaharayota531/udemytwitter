import 'package:flutter/material.dart';
import 'package:udemypractice/main.dart';
//
import 'package:udemypractice/models/main_model.dart';
//constants
import 'package:udemypractice/constants/strings.dart';
import 'package:udemypractice/constants/routes.dart';

class AccountPage extends StatelessWidget {
  AccountPage({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(accountTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(logoutText),
            onTap: () async {
              await mainModel.logout(context: context);
            },
          ),
        ],
      ),
    );
  }
}
