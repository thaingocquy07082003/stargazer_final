import 'package:flutter/material.dart';
import 'package:stargazer/core/services/data/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserInfo? _user;

  setUser(UserInfo user) {
    _user = user;
    notifyListeners();
  }

  UserInfo? getUser() {
    return _user;
  }
}
