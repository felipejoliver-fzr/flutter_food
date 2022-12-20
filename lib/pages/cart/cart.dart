import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food/components/product-item.dart';
import 'package:flutter_food/daos/order-dao.dart';
import 'package:flutter_food/models/order.dart';
import 'package:flutter_food/shared/cart-store.dart';
import 'package:flutter_food/utils/customStyles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartStore = context.read<CartStore>();

    Widget _buildItem(int index) {
      ProductItem product = cartStore.cartProducts[index];
      return Padding(
        padding: cardPadding,
        child: Container(
            decoration: cardBoxStyle(),
            child: ProductItem(
                id: product.id,
                img: product.img,
                description: product.description,
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
        Observer(builder: (_) {
          return Visibility(
            visible: cartStore.listContains == false,
            child: const Text(
              "Carrinho vazio",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
        }),
        Expanded(
          child: Observer(builder: (_) {
            return ListView.separated(
                itemBuilder: (_, index) {
                  return _buildItem(index);
                },
                separatorBuilder: (_, __) => const SizedBox(
                      height: 10,
                    ),
                itemCount: cartStore.cartProducts.length);
          }),
        ),
        Container(
          color: Colors.grey[50],
          height: 50,
          width: double.infinity,
          child: Observer(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: cartStore.listContains,
                  child: Text(
                    "Total: R\$ ${cartStore.getTotalCart}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 20, //<-- SEE HERE
                ),
                Visibility(
                  visible: cartStore.listContains,
                  child: ElevatedButton(
                    onPressed: () async {
                      List<String> productsString = [];
                      double totalPrice = 0;

                      for (var c = 0; c < cartStore.cartProducts.length; c++) {
                        var product = cartStore.cartProducts[c];
                        totalPrice += product.price;
                        productsString.add(
                            '{"name": ${product.name}, "price": ${product.price}, "quantity": 1}');
                      }

                      String jsonProducts = jsonEncode(productsString);
                      String datetime =
                          DateFormat.yMMMd().format(DateTime.now());
                      Order order = Order('Cliente Teste', jsonProducts,
                          datetime: datetime, price: totalPrice);

                      int id = await OrderDAO().insertOrder(order);
                      cartStore.clear();
                    },
                    child: const Text(
                      'Confirmar pedido',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            );
          }),
        )
      ]),
    );
  }
}
