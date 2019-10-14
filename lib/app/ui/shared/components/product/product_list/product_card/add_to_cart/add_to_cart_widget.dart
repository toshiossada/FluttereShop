import 'package:flutter/material.dart';
import 'package:shopping/app/models/cart-item.model.dart';
import 'package:shopping/app/models/product-list-item.model.dart';
import 'package:shopping/app/ui/shared/blocs/cart_bloc.dart';
import 'package:shopping/app/ui/ui_module.dart';

class AddToCartWidget extends StatelessWidget {
  final ProductListItemModel item;
  bool _itemInCart = false;
  CartItemModel _cartItem;
  final _bloc = UiModule.to.getBloc<CartBloc>();

  AddToCartWidget({@required this.item}) {
    _cartItem = CartItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _bloc.outItemInCart,
        initialData: false,
        builder: (context, snapshot) {
          _itemInCart = _bloc.itemInCart(_cartItem);
          var params = _getFlatButtonParams(_itemInCart, context);

          return FlatButton(
            color: params['color'],
            child: Icon(params['icon']),
            textColor: Colors.white,
            onPressed: () {
              params['callback']();
              final snackbar =
                  SnackBar(content: Text('${item.title} ${params['label']}!'));
              Scaffold.of(context).showSnackBar(snackbar);
            },
          );
        });
  }

  Map<String, dynamic> _getFlatButtonParams(bool inCart, BuildContext context) {
    var result = {
      'color': null,
      'icon':  null,
      'label': '',
      'callback': () {        
      }
    };
    if (!inCart) {
      result['color'] = Theme.of(context).primaryColor;
      result['icon'] = Icons.add_shopping_cart;
      result['label'] = 'adiconado';
      result['callback'] = () {
        _bloc.add(_cartItem);
      };
    } else {
      result = {
        'color': Colors.red,
        'icon': Icons.remove_shopping_cart,
        'label': 'removido',
        'callback': () {
          _bloc.remove(_cartItem);
        }
      };
    }

    return result;
  }
}
