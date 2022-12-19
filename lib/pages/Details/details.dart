import 'package:flutter/material.dart';
import 'package:flutter_food/shared/cart-store.dart';
import 'package:provider/provider.dart';

import '../../components/product-item.dart';

// ignore: must_be_immutable
class DetailsProducts extends StatefulWidget {
  ProductItem product;
  DetailsProducts({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsProducts> createState() => _DetailsProductsState();
}

class _DetailsProductsState extends State<DetailsProducts> {
  late int _increment = 1;

  @override
  Widget build(BuildContext context) {
    final cartStore = context.read<CartStore>();

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Card(
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Center(
                    child: Image.asset(
                  'images/xburguer.png',
                )),
                ListTile(
                  title: Text(widget.product.name),
                  subtitle: Text(widget.product.price.toString()),
                ),
                ListTile(
                  subtitle: Text(widget.product.description),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('-'),
                      onPressed: () => setState(() => {
                            if (_increment >= 2) {_increment--}
                          }),
                    ),
                    const SizedBox(width: 8),
                    Text(_increment.toString()),
                    TextButton(
                      child: const Text('+'),
                      onPressed: () => setState(() => _increment++),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () => {
                        cartStore.increment(_increment),
                        cartStore.addToCart(widget.product, _increment),
                        Navigator.pop(context)
                      },
                      child: const Text('Adicionar ao carrinho'),
                    )
                  ],
                ),
              ]),
            )));
  }
}
