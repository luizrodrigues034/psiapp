import 'package:flutter/material.dart';
import 'package:psiapp/utils/colors.dart';

class ThemeController extends ValueNotifier<bool> {
  bool colorController = false;

  ThemeController() : super(false);

  void toggleColor() {
    value = !value;
    notifyListeners();
  }
}
