import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/ui/shared/blocs/cart_bloc.dart' as Shared;
import 'package:shopping/app/models/cart-item.model.dart';
import 'package:shopping/app/ui/shared/components/loader/loader_widget.dart';
import 'package:shopping/app/ui/android/components/cart_item/cart_item_widget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final price = new NumberFormat('#,##00.00', 'pt_BR');
  var items = List<CartItemModel>();
  var _bloc=  AppModule.to.getBloc<Shared.CartBloc>();

  @override
  Widget build(BuildContext context) {
    items = _bloc.get();
    return StreamBuilder<List<CartItemModel>>(
      stream: _bloc.outCart,
      builder: (context, snapshot) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: LoaderWidget(
                    object: snapshot.data,
                    callback: list,
                  ),
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(20),
                  child: StreamBuilder<double>(
                    stream: _bloc.outTotal,
                    initialData: 0,
                    builder: (context, snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'R\$ ${price.format(snapshot.data)}',
                            style: TextStyle(fontSize: 30),
                          ),
                          FlatButton(
                            child: Text('Checkout'),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {},
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget list(){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index){
        return Dismissible(
          child: CartItemWidget(
            item: items[index]
          ),
          key: Key(items[index].id),
          onDismissed: (direction){
            _bloc.remove(items[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
      },
    );
  }
}
