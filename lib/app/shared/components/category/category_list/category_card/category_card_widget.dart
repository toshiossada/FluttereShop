import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/blocs/home_bloc.dart';
import 'package:shopping/app/blocs/theme_bloc.dart';
import 'package:shopping/app/models/category-list-item.model.dart';
import 'package:shopping/app/settings.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryListItemModel item;
  final _bloc = AppModule.to.getBloc<HomeBloc>();
  final _blocTheme = AppModule.to.getBloc<ThemeBloc>();
  CategoryCardWidget({@required this.item});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _bloc.outSelectedCategory,
      builder: (context, snapshot) {
        return Container(
          width: 70,
          height: 70,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: item.tag == snapshot.data
                ? Theme.of(context).primaryColor.withOpacity(0.3)
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(70),
            ),
          ),
          child: StreamBuilder<String>(
            stream: _blocTheme.outStringTheme,
            initialData: Settings.theme,
            builder: (context, snapshot) {
              return FlatButton(
                child:
                    Image.asset('assets/categories/${Settings.theme}/${item.tag}.png'),
                onPressed: () {
                  _bloc.changeCategory(item.tag);
                },
              );
            }
          ),
        );
      }
    );
  }
}
