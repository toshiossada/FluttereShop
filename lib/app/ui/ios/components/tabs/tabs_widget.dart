import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/app/ui/android/pages/account/account_page.dart';
import 'package:shopping/app/ui/android/pages/cart/cart_page.dart';
import 'package:shopping/app/ui/ios/pages/home/home_page.dart';

class TabsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Carrinho'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
            title: Text('Login'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage();
              case 1:
                return CartPage();
              default:
                return AccountPage();
            }
          },
        );
      },
    );
  }
}
