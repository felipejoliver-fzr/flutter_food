import 'package:flutter/material.dart';
import 'package:flutter_food/shared/cart-store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final cartStore = context.read<CartStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('NOSSO CARDÁPIO')),
        actions: [
          IconButton(
              onPressed: () {
                cartStore.increment();
                cartStore.addToCart();
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) => const Text('teste'
                  //'${cartStore.getValue} ${cartStore.cartProducts.last.name}',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
