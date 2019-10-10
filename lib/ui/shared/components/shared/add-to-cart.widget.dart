import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/models/cart-item.model.dart';
import 'package:shopping/models/product-list-item.model.dart';

class AddToCart extends StatelessWidget {
  final ProductListItemModel item;

  AddToCart({@required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    var cartItem = CartItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );



    Color color;
    IconData icon;
    Function callback;
    String resultado;

    if (!bloc.itemInCart(cartItem)) {
      color = Theme.of(context).primaryColor;
      icon = Icons.add_shopping_cart;
      resultado = 'adiconado';
      callback = () {
        bloc.add(cartItem);
      };
    } else {
      color = Colors.red;
      icon = Icons.remove_shopping_cart;
      resultado = 'removido';
      callback = () {
        bloc.remove(cartItem);
      };
    }
    return FlatButton(
      color: color,
      child: Icon(icon),
      textColor: Colors.white,
      onPressed: () {
        callback();
        final snackbar = SnackBar(content: Text('${item.title} $resultado!'));
        Scaffold.of(context).showSnackBar(snackbar);
      },
    );
  }
}
