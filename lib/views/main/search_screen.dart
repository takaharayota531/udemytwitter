import 'package:flutter/material.dart';
//constants
import 'package:udemypractice/constants/strings.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(searchText),
    );
  }
}
