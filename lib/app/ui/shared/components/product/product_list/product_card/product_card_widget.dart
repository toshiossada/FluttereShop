import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/app/models/product-list-item.model.dart';
import 'package:shopping/app/ui/android/pages/product/product_page.dart';

import 'add_to_cart/add_to_cart_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductListItemModel item;

  ProductCardWidget({@required this.item});

  @override
  Widget build(BuildContext context) {
    final price = new NumberFormat('#,##0.00', 'pt_BR');

    return Container(
      margin: EdgeInsets.all(5),
      width: 240,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            tag: item.tag,
                          )));
            },
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                image: DecorationImage(image: NetworkImage(item.image)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              item.brand,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 120,
                    child: Text(
                      'R\$ ${price.format(item.price)}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    )),
                AddToCartWidget(item: item),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
