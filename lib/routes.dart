import 'package:flutter/material.dart';
import 'package:flutter_food/navigator_keys.dart';
import 'package:flutter_food/pages/home/home.dart';
import 'package:flutter_food/pages/menu/menu.dart';
import 'package:flutter_food/pages/favorite/favorite.dart';
import 'package:flutter_food/pages/profile/profile.dart';
import 'package:flutter_food/tab_item_widget.dart';

get tabs => [
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const Favorite(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyFavorite,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const Menu(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyMenu,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const Profile(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyProfile,
      ),
    ];

Map<String, WidgetBuilder> get routes => {
      '/': (context) => const HomePage(),
      // '/page4': (context) {
      //   final args = ModalRoute.of(context)!.settings.arguments;
      //   if (args is Map<String, String>) {
      //     final name = args['name'];
      //     return Page4(name: name);
      //   }

      //   return const Page4();
      // }
    };
