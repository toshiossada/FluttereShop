import 'package:shopping/app/ui/android/components/tabs/tabs_bloc.dart';
import 'package:shopping/app/ui/android/pages/signup/signup_bloc.dart';
import 'package:shopping/app/ui/android/pages/settings/settings_bloc.dart';
import 'package:shopping/app/ui/android/pages/product/product_bloc.dart';
import 'package:shopping/app/ui/android/pages/login/login_bloc.dart';
import 'package:shopping/app/ui/android/pages/account/account_bloc.dart';
import 'package:shopping/app/ui/android/pages/cart/cart_bloc.dart';
import 'package:shopping/app/ui/android/components/cart_item/cart_item_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shopping/app/ui/android/components/tabs/tabs_widget.dart' as android;
//import 'package:shopping/ui/ios/pages/tabs_page.dart' as ios;

import 'pages/home/home_module.dart';

class AndroidModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TabsBloc()),
        Bloc((i) => SignupBloc()),
        Bloc((i) => SettingsBloc()),
        Bloc((i) => ProductBloc()),
        Bloc((i) => LoginBloc()),
        Bloc((i) => AccountBloc()),
        Bloc((i) => CartBloc()),
        Bloc((i) => CartItemBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => DefaultTabController(
              length: 3,
              child: android.TabsWidget(),
            );

  static Inject get to => Inject<AndroidModule>.of();
}
