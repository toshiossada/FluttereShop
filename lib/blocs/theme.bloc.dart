import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/settings.dart';
import 'package:shopping/themes/dark-yellow.theme.dart';
import 'package:shopping/themes/dark.theme.dart';
import 'package:shopping/themes/light.theme.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  ThemeBloc() {
    load();
  }

  change(String color) {
    switch (color) {
      case 'light':
        {
          theme = lightTheme();
          Settings.theme = 'light';
          notifyListeners();
          break;
        }
      case 'dark':
        {
          theme = darkTheme();
          Settings.theme = 'dark';
          notifyListeners();
          break;
        }
      case 'dark-yellow':
        {
          theme = darkYellowTheme();
          Settings.theme = 'dark-yellow';
          notifyListeners();
          break;
        }
      default:
    }

    save(color);
  }

  save(String theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getString('theme');
    Settings.theme = theme == null || theme.isEmpty ? 'light' : theme;
    change(Settings.theme);
  }
}
