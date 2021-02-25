import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier{
  bool isDark = false;

  void changeTheme(){
    isDark = !isDark;
    notifyListeners();
  }

  bool getTheme(){
    return isDark;
  }
}