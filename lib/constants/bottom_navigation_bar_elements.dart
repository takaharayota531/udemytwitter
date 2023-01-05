import 'package:flutter/material.dart';
//constants
import 'package:udemypractice/constants/strings.dart';

final List<BottomNavigationBarItem> bottomNavigationBarElements = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: homeText),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: searchText),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: profileText),
];
