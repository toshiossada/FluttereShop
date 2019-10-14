import 'package:dio/dio.dart';
import 'package:shopping/app/repositories/product_repository.dart';
import 'package:shopping/app/repositories/category_repository.dart';
import 'package:shopping/app/repositories/account_repository.dart';
import 'package:shopping/app/shared/blocs/theme_bloc.dart';
import 'package:shopping/app/shared/blocs/user_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shopping/app/app_widget.dart';
import 'package:shopping/app/app_bloc.dart';
import 'package:shopping/app/shared/custom_dio/custom_dio.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ThemeBloc()),
        Bloc((i) => UserBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => Dio()),
        Dependency((i) => CustomDio(i.getDependency<Dio>())),
        Dependency(
            (i) => ProductRepository(AppModule.to.getDependency<CustomDio>())),
        Dependency(
            (i) => CategoryRepository(AppModule.to.getDependency<CustomDio>())),
        Dependency(
            (i) => AccountRepository(AppModule.to.getDependency<CustomDio>())),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
