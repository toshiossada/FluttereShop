import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/blocs/theme.bloc.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/ui/android/pages/tabs_page.dart' as android;
import 'package:shopping/ui/ios/pages/tabs_page.dart' as ios;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ThemeBloc>(context);
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      home: Platform.isIOS
          ? ios.TabsPage()
          : DefaultTabController(
              length: 3,
              child: android.TabsPage(),
            ),
    );
  }
}
