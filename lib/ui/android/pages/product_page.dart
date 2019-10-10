import 'package:flutter/material.dart';
import 'package:shopping/blocs/product.bloc.dart';
import 'package:shopping/models/product-details.model.dart';
import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/ui/shared/components/shared/add-to-cart.widget.dart';
import 'package:shopping/ui/shared/components/shared/progress-indicator.widget.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _bloc = ProductBloc();

  ProductPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _bloc.get(tag),
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
        actions: <Widget>[AddToCart(item: item)],
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
