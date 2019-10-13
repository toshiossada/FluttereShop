import 'package:flutter/material.dart';
import 'package:shopping/app/models/product-details.model.dart';
import 'package:shopping/app/models/product-list-item.model.dart';
import 'package:shopping/app/shared/components/shared/add_to_cart/add_to_cart_widget.dart';
import 'package:shopping/app/shared/components/shared/progress_indicator/progress_indicator_widget.dart';
import 'package:shopping/app/ui/android/android_module.dart';

import 'product_bloc.dart';

class ProductPage extends StatefulWidget {
  final String tag;

  ProductPage({@required this.tag});

  @override
  _ProductPageState createState() => _ProductPageState(tag: tag);
}

class _ProductPageState extends State<ProductPage> {
  final String tag;
  final _bloc = AndroidModule.to.getBloc<ProductBloc>();

  _ProductPageState({@required this.tag});

  @override
  Widget build(BuildContext context) {
    var _ = _bloc.get(tag);
    return StreamBuilder<Future<ProductDetailsModel>>(
        stream: _bloc.outProduct,
        builder: (context, snapshot) {
          return FutureBuilder<ProductDetailsModel>(
            future: snapshot.data,
            builder: (context, snapshot) {
              var product = snapshot.data;

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Aguardando...');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: GenericProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.error),
                    );
                  else
                    return content(product);

                  break;
                default:
                  return null;
              }
            },
          );
        });
  }

  Widget content(ProductDetailsModel product) {
    var item = ProductListItemModel();

    item.id = product.id;
    item.title = product.title;
    item.brand = product.brand;
    item.tag = product.tag;
    item.price = product.price;
    item.image = product.images[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: <Widget>[AddToCartWidget(item: item)],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            child: Image.network(product.images[index]),
          );
        },
      ),
    );
  }
}
