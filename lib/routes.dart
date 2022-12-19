import 'package:flutter/material.dart';
import 'package:flutter_food/navigator_keys.dart';
import 'package:flutter_food/pages/Details/details.dart';
import 'package:flutter_food/pages/home/home.dart';
import 'package:flutter_food/pages/menu/menu.dart';
import 'package:flutter_food/pages/cart/cart.dart';
import 'package:flutter_food/pages/orders/orders.dart';
import 'package:flutter_food/tab_item_widget.dart';

get tabs => [
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const Cart(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyCart,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const Menu(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyMenu,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const Orders(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyOrders,
      ),
    ];

Map<String, WidgetBuilder> get routes => {
      '/': (context) => const HomePage(),
    };
