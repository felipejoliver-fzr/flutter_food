import 'package:flutter/material.dart';
import 'package:flutter_food/components/product-item.dart';
import 'package:flutter_food/shared/cart-store.dart';
import 'package:flutter_food/utils/customStyles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartStore>();

    Widget _buildItem(int index) {
      ProductItem product = cartController.cartProducts[index];
      return Padding(
        padding: cardPadding,
        child: Container(
            decoration: cardBoxStyle(),
            child: ProductItem(
                img: product.img,
                name: product.name,
                price: product.price,
                quantity: product.quantity)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CARRINHO'),
      ),
      body: Column(children: [
        Expanded(
          child: Observer(builder: (_) {
            return ListView.separated(
                itemBuilder: (_, index) {
                  return _buildItem(index);
                },
                separatorBuilder: (_, __) => const SizedBox(
                      height: 10,
                    ),
                itemCount: cartController.cartProducts.length);
          }),
        ),
      ]),
    );
  }
}
