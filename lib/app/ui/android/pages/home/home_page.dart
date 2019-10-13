import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/blocs/home_bloc.dart';
import 'package:shopping/app/models/category-list-item.model.dart';
import 'package:shopping/app/models/product-list-item.model.dart';
import 'package:shopping/app/shared/components/category/category_list/category_list_widget.dart';
import 'package:shopping/app/shared/components/product/product_list/product_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = AppModule.to.getBloc<HomeBloc>();
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
