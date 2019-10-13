import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/shared/blocs/cart_bloc.dart';
import 'package:shopping/app/models/cart-item.model.dart';
import 'package:shopping/app/models/product-list-item.model.dart';

class AddToCartWidget extends StatefulWidget {
  final ProductListItemModel item;
  bool itemInCart;
  CartItemModel cartItem;
  final _bloc = AppModule.to.getBloc<CartBloc>();

  AddToCartWidget({@required this.item}) {
    cartItem = CartItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );

    itemInCart = _bloc.itemInCart(cartItem);
  }

  @override
  _AddToCartWidgetState createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  final _bloc = AppModule.to.getBloc<CartBloc>();
  Color color;
  IconData icon;
  Function callback;
  String resultado;

  @override
  Widget build(BuildContext context) {
    if (!widget.itemInCart) {
      color = Theme.of(context).primaryColor;
      icon = Icons.add_shopping_cart;
      resultado = 'adiconado';
      callback = () {
        _bloc.add(widget.cartItem);
        setState(() {
          widget.itemInCart = !widget.itemInCart;
        });
      };
    } else {
      color = Colors.red;
      icon = Icons.remove_shopping_cart;
      resultado = 'removido';
      callback = () {
        _bloc.remove(widget.cartItem);
        setState(() {
          widget.itemInCart = !widget.itemInCart;
        });
      };
    }
    return FlatButton(
      color: color,
      child: Icon(icon),
      textColor: Colors.white,
      onPressed: () {
        callback();
        final snackbar =
            SnackBar(content: Text('${widget.item.title} $resultado!'));
        Scaffold.of(context).showSnackBar(snackbar);
      },
    );
  }
}
