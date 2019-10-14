
import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/shared/blocs/theme_bloc.dart';
import 'package:shopping/app/themes/light.theme.dart';
import 'package:shopping/app/ui/ui_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AppModule.to.getBloc<ThemeBloc>();
    return StreamBuilder<ThemeData>(
        stream: bloc.outTheme,
        initialData: lightTheme(),
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Slidy',
            theme: snapshot.data,
            home: UiModule(),
          );
        });
  }
}
