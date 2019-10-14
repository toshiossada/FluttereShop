import 'package:flutter/material.dart';
import 'package:shopping/app/models/product-list-item.model.dart';
import 'package:shopping/app/ui/shared/components/loader/loader_widget.dart';

import 'product_card/product_card_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductListItemModel> products;

  ProductListWidget({@required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: LoaderWidget(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductCardWidget(
            item: products[index],
          ),
        );
      },
    );
  }
}
