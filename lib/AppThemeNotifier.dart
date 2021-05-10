/*
* File : App Theme Notifier (Listener)
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeNotifier extends ChangeNotifier {

  int _themeMode = 1;

  AppThemeNotifier() {
    init();
  }

  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int data =  sharedPreferences.getInt("themeMode");
    if(data==null)
      _themeMode = 1;
    else
      _themeMode = data;
    notifyListeners();
  }

  themeMode() => _themeMode;

  notify(){
    notifyListeners();
  }

  Future<void> updateTheme(int themeMode) async {
    this._themeMode = themeMode;
    notifyListeners();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("themeMode", themeMode);
  }
}