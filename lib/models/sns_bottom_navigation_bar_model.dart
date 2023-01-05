//flutter
import 'package:flutter/material.dart';
//oackages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/constants/ints.dart';

final SNSBottomNavigationBarProvider =
    ChangeNotifierProvider((ref) => SNSBottomNavigationBarModel());

class SNSBottomNavigationBarModel extends ChangeNotifier {
  int currenIndex = 0;
  late PageController pageController;

  SNSBottomNavigationBarModel() {
    init();
  }
  void init() {
    pageController = PageController(initialPage: currenIndex);
    notifyListeners();
  }

  void onPageChanged({required int index}) {
    currenIndex = index;
    notifyListeners();
  }

  void onTapTapped({required int index}) {
    currenIndex = 1;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: pageAnimationDuration),
        curve: Curves.easeIn);
  }

  void setPageController() {
    pageController = PageController(
      initialPage: currenIndex,
    );
    notifyListeners();
  }
}
