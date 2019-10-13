import 'package:shopping/app/ui/ios/components/tabs/tabs_widget.dart';
import 'package:shopping/app/ui/ios/pages/home/home_bloc.dart';
import 'package:shopping/app/ui/ios/components/tabs/tabs_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class IosModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
        Bloc((i) => TabsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => TabsWidget();

  static Inject get to => Inject<IosModule>.of();
}
