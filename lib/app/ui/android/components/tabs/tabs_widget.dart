import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/blocs/cart_bloc.dart';
import 'package:shopping/app/models/cart-item.model.dart';
import 'package:shopping/app/ui/android/pages/account/account_page.dart';
import 'package:shopping/app/ui/android/pages/cart/cart_page.dart';
import 'package:shopping/app/ui/android/pages/home/home_page.dart';

class TabsWidget extends StatelessWidget {
  final _bloc = AppModule.to.getBloc<CartBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          HomePage(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_cart),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: StreamBuilder<List<CartItemModel>>(
                        stream: _bloc.outCart,
                        builder: (context, snapshot) {
                          return Text(
                            !snapshot.hasData
                                ? '0'
                                : snapshot.data.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
          Tab(
            icon: Icon(Icons.perm_identity),
          ),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
