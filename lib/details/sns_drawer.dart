import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// constants
import 'package:udemypractice/constants/routes.dart' as routes;
import 'package:udemypractice/constants/strings.dart';
// model
import 'package:udemypractice/models/main_model.dart';
import 'package:udemypractice/models/themes_model.dart';

class SNSDrawer extends StatelessWidget {
  SNSDrawer({
    Key? key,
    required this.mainModel,
    required this.themeModel,
  }) : super(key: key);

  final MainModel mainModel;
  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(accountTitle),
            onTap: () =>
                routes.toAccountPage(context: context, mainModel: mainModel),
          ),
          ListTile(
            title: Text(themeTitle),
            // アイコンやスイッチを置く合図
            trailing: CupertinoSwitch(
                value: themeModel.isDarkTheme,
                onChanged: (value) {
                  themeModel.setIsDarkTheme(value: value);
                }),
          ),
          ListTile(
            title: Text(accountTitle),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
