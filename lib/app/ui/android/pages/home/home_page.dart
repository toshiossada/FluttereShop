import 'package:flutter/material.dart';
import 'package:shopping/app/ui/shared/blocs/home_bloc.dart' as Shared;
import 'package:shopping/app/models/category-list-item.model.dart';
import 'package:shopping/app/models/product-list-item.model.dart';
import 'package:shopping/app/ui/shared/components/category/category_list/category_list_widget.dart';
import 'package:shopping/app/ui/shared/components/product/product_list/product_list_widget.dart';
import 'package:shopping/app/ui/ui_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = UiModule.to.getBloc<Shared.HomeBloc>();
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Text(
            'Categorias',
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<List<CategoryListItemModel>>(
            stream: bloc.outCategories,
            builder: (context, snapshot) {
              if(!snapshot.hasData) return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.grey),));
              return CategoryListWidget(
                categories: snapshot.data,
              );
            }
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Mais Vendidos',
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<List<ProductListItemModel>>(
            stream: bloc.outProducts,
            builder: (context, snapshot) {
              if(!snapshot.hasData) return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.grey),));
              return ProductListWidget(
                products: snapshot.data,
              );
            }
          ),
        ],
      ),
    );
  }
}
