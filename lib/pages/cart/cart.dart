import 'package:flutter/material.dart';
import 'package:flutter_food/components/product-item.dart';
import 'package:flutter_food/utils/customStyles.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

List<ProductItem> products = [
  const ProductItem(
      name: "X-Burguer", price: 20, img: "xburguer.png", quantity: 1),
  const ProductItem(
      name: "X-Burguer", price: 20, img: "xburguer.png", quantity: 1)
];

Widget _buildItem(int index) {
  ProductItem product = products[index];
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

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CARRINHO'),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => _buildItem(index),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: products.length),
        ),
        Container(
          color: Colors.grey[50],
          height: 50,
          width: double.infinity,
          child: const Text(
            "Total: R\$ 50,00",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )
      ]),
    );
  }
}
