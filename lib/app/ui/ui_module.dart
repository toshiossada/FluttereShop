import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shopping/app/ui/android/android_module.dart';
import 'package:shopping/app/ui/ios/ios_module.dart';

import 'package:shopping/app/ui/shared/account/authenticated_user_card/authenticated_user_card_bloc.dart';
import 'package:shopping/app/ui/shared/account/unauthenticated_user_card/unauthenticated_user_card_bloc.dart';
import 'package:shopping/app/ui/shared/blocs/cart_bloc.dart';
import 'package:shopping/app/ui/shared/blocs/home_bloc.dart';
import 'package:shopping/app/ui/shared/components/category/category_list/category_card/category_card_bloc.dart';
import 'package:shopping/app/ui/shared/components/product/product_list/product_card/add_to_cart/add_to_cart_bloc.dart';
import 'package:shopping/app/ui/shared/components/product/product_list/product_card/product_card_bloc.dart';
import 'package:shopping/app/ui/shared/components/progress_indicator/progress_indicator_bloc.dart';
import 'package:shopping/app/ui/shared/components/loader/loader_bloc.dart';
import 'package:shopping/app/ui/shared/components/product/product_list/product_list_bloc.dart';
import 'package:shopping/app/ui/shared/components/category/category_list/category_list_bloc.dart';

class UiModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CartBloc()),
        Bloc((i) => HomeBloc()),
        Bloc((i) => ProgressIndicatorBloc()),
        Bloc((i) => LoaderBloc()),
        Bloc((i) => AddToCartBloc()),
        Bloc((i) => ProductListBloc()),
        Bloc((i) => ProductCardBloc()),
        Bloc((i) => CategoryListBloc()),
        Bloc((i) => CategoryCardBloc()),
        Bloc((i) => UnauthenticatedUserCardBloc()),
        Bloc((i) => AuthenticatedUserCardBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Platform.isIOS ? IosModule() : AndroidModule();

  static Inject get to => Inject<UiModule>.of();
}
