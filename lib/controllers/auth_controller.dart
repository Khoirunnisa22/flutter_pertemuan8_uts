import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  String username = '';
  bool isLoggedIn = false;

  bool login(String user, String pass) {
    if (user.isNotEmpty && pass.length >= 6) {
      username = user;
      isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }
}
