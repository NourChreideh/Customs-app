
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class PrefProvider with ChangeNotifier {
  SharedPreferences _prefs;

  PrefProvider(this._prefs) {}

  void login() {
    _prefs.setBool("isLoggedIn", true);
  }

  void logout() {
    _prefs.setBool('isLoggedIn', false);
  }

  bool isLoggedIn() {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  void setId(String id) {
    _prefs.setString('id', id);
  }

  String getId() {
    return _prefs.getString('id') ?? "";
  }
    void setname(String name) {
    _prefs.setString('name', name);
  }

  String getname() {
    return _prefs.getString('name') ?? "";
  }
  
     void setemail(String email) {
    _prefs.setString('email', email);
  }

  String getemail() {
     return _prefs.getString('email') ?? "";
}
     void setbio(String bio) {
    _prefs.setString('bio', bio);
  }

  String getbio() {
     return _prefs.getString('bio') ?? "";
}
}