import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/app/settings.dart';
import 'package:shopping/app/themes/dark-yellow.theme.dart';
import 'package:shopping/app/themes/dark.theme.dart';
import 'package:shopping/app/themes/light.theme.dart';

class ThemeBloc extends BlocBase {
  var theme = lightTheme();
  final _themeController = BehaviorSubject<ThemeData>();
  final _stringThemeController = BehaviorSubject<String>();

  Stream<ThemeData> get outTheme => _themeController.stream;
  Stream<String> get outStringTheme =>
      _stringThemeController.stream;
  ThemeBloc() {
    load();
  }

  change(String color) {
    switch (color) {
      case 'light':
        {
          theme = lightTheme();
          Settings.theme = 'light';
          break;
        }
      case 'dark':
        {
          theme = darkTheme();
          Settings.theme = 'dark';
          break;
        }
      case 'dark-yellow':
        {
          theme = darkYellowTheme();
          Settings.theme = 'dark-yellow';
          break;
        }
      default:
    }
    _themeController.add(theme);
    _stringThemeController.add(Settings.theme);
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
    _themeController.add(this.theme);
    _stringThemeController.add(Settings.theme);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
