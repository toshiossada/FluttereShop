import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:shopping/app/models/cart-item.model.dart';

class CartBloc extends BlocBase {
  var _cart = List<CartItemModel>();
  final _cartController = BehaviorSubject<List<CartItemModel>>();
  final _itemInCartController= BehaviorSubject<bool>();

  Stream<List<CartItemModel>> get outCart => _cartController.stream;
  Stream<bool> get outItemInCart => _itemInCartController.stream;

  final _totalController = BehaviorSubject<double>();

  List<CartItemModel> get() {
    return _cart;
  }

  Stream<double> get outTotal => _totalController.stream;

  add(CartItemModel item) {
    _cart.add(item);
    calcularTotal();
    _cartController.add(_cart);
    _itemInCartController.add(itemInCart(item));
  }

  remove(CartItemModel item) {
    _cart.removeWhere((x) => x.id == item.id);
    calcularTotal();
    _cartController.add(_cart);
    _itemInCartController.add(itemInCart(item));
  }

  itemInCart(CartItemModel item) {
    var i = _cart.where((x) => x.id == item.id);
    _cartController.add(_cart);
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
    double total = 0;
    _cart.forEach((x) => total += (x.price * x.quantity));

    _totalController.add(total);

    _cartController.add(_cart);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}

