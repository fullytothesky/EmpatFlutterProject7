import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStateModel with ChangeNotifier {
  PreferencesStateModel() {
    loadTheme();
  }
  static const String USER_NAME = 'username';
  static const String THEME = 'apptheme';
  String _savedTheme = '';
  String _username = '';

  get savedTheme {
    return _savedTheme;
  }

  get savedUsername {
    return _username;
  }

  loadTheme() async {
    var preferences;
    preferences = await SharedPreferences.getInstance();
    String theme = preferences.getString(THEME);
    if (theme == 'dark') {
      _savedTheme = 'dark';
    } else {
      _savedTheme = 'light';
    }
    String username = preferences.getString(USER_NAME) ?? "User";
    _username = username;
    notifyListeners();
  }

  setUsername(String value) async {
    var preferences;
    preferences = await SharedPreferences.getInstance();
    preferences.setString(USER_NAME, value);
    _username = value;
    notifyListeners();
  }

  setTheme(value) async {
    var preferences;
    preferences = await SharedPreferences.getInstance();
    preferences.setString(THEME, value);
    _savedTheme = value;
    notifyListeners();
  }
}
