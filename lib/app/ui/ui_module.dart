import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shopping/app/ui/android/android_module.dart';
import 'package:shopping/app/ui/ios/ios_module.dart';

class UiModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Platform.isIOS ? IosModule() : AndroidModule();

  static Inject get to => Inject<UiModule>.of();
}
