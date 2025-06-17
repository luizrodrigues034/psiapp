import 'package:flutter/material.dart';
import 'package:psiapp/utils/colors.dart';

class ThemeController extends ChangeNotifier {
  bool colorController = false;

  void toggleColor() {
    colorController = !colorController;
    notifyListeners();
  }
}
