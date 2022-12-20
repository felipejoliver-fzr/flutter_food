import 'package:flutter/material.dart';
import 'package:flutter_food/shared/cart-store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'routes.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<CartStore>(
      create: (_) => CartStore(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Tes teste teste';

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        routes: {...routes},
        title: _title,
        initialRoute: '/',
      );
    });
  }
}
