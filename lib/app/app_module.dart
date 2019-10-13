import 'package:shopping/app/blocs/theme_bloc.dart';
import 'package:shopping/app/blocs/product_bloc.dart';
import 'package:shopping/app/blocs/home_bloc.dart';
import 'package:shopping/app/blocs/cart_bloc.dart';
import 'package:shopping/app/repositories/product_repository.dart';
import 'package:shopping/app/repositories/category_repository.dart';
import 'package:shopping/app/repositories/account_repository.dart';
import 'package:shopping/app/shared/components/category/category_list/category_card/category_card_bloc.dart';
import 'package:shopping/app/shared/components/product/product_list/product_card/product_card_bloc.dart';
import 'package:shopping/app/shared/components/shared/progress_indicator/progress_indicator_bloc.dart';
import 'package:shopping/app/shared/components/shared/loader/loader_bloc.dart';
import 'package:shopping/app/shared/components/shared/add_to_cart/add_to_cart_bloc.dart';
import 'package:shopping/app/shared/components/product/product_list/product_list_bloc.dart';
import 'package:shopping/app/shared/components/category/category_list/category_list_bloc.dart';
import 'package:shopping/app/shared/components/account/unauthenticated_user_card/unauthenticated_user_card_bloc.dart';
import 'package:shopping/app/shared/components/account/authenticated_user_card/authenticated_user_card_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shopping/app/app_widget.dart';
import 'package:shopping/app/app_bloc.dart';
import 'package:shopping/app/blocs/user_bloc.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
        Bloc((i) => ThemeBloc()),
        Bloc((i) => ProductBloc()),
        Bloc((i) => CartBloc()),
        Bloc((i) => ProgressIndicatorBloc()),
        Bloc((i) => LoaderBloc()),
        Bloc((i) => AddToCartBloc()),
        Bloc((i) => ProductListBloc()),
        Bloc((i) => ProductCardBloc()),
        Bloc((i) => CategoryListBloc()),
        Bloc((i) => CategoryCardBloc()),
        Bloc((i) => UnauthenticatedUserCardBloc()),
        Bloc((i) => AuthenticatedUserCardBloc()),
        Bloc((i) => UserBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => ProductRepository()),
        Dependency((i) => CategoryRepository()),
        Dependency((i) => AccountRepository()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
