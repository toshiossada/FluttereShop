import 'package:flutter/foundation.dart';
import 'package:shopping/models/cart-item.model.dart';

class CartBloc extends ChangeNotifier {
  var cart = List<CartItemModel>();
  double total = 0;

  get() {
    return cart;
  }

  add(CartItemModel item) {
    cart.add(item);
    calcularTotal();
  }

  remove(CartItemModel item) {
    cart.removeWhere((x) => x.id == item.id);
    calcularTotal();
  }

  itemInCart(CartItemModel item) {
    var i = cart.where((x) => x.id == item.id);

    return i != null && i.length > 0;
  }

  increase(CartItemModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calcularTotal();
    }
  }

  decrease(CartItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
      calcularTotal();
    }
  }

  calcularTotal() {
    total = 0;
    cart.forEach((x) => total += (x.price * x.quantity));

    notifyListeners();
  }
}
