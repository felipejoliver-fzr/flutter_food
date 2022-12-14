import 'package:flutter/material.dart';
import 'package:flutter_food/components/product-item.dart';
import 'package:flutter_food/pages/Details/details.dart';
import 'package:flutter_food/shared/cart-store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_food/utils/customStyles.dart';

import '../home/home_controller.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<ProductItem> products = [
    // ignore: prefer_const_constructors
    ProductItem(
        id: 1,
        name: "X Burguer",
        description: 'Huuum, esse é o melhor sanduiche da cidade. Experimente',
        price: 29.00,
        img: "images/xburguer.png",
        quantity: 1),
    // ignore: prefer_const_constructors
    ProductItem(
        id: 2,
        name: "CheeseSalad",
        description: 'Huuum, esse é o melhor sanduiche da cidade. Experimente',
        price: 29.00,
        img: "images/xburguer.png",
        quantity: 1),
    // ignore: prefer_const_constructors
    ProductItem(
        id: 3,
        name: "Cheeseburger",
        description: 'Huuum, esse é o melhor sanduiche da cidade. Experimente',
        price: 19.00,
        img: "images/xburguer.png",
        quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    final _controller = HomeController();

    final cartStore = context.read<CartStore>();
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('NOSSO CARDÁPIO'))),
      body: ListView.separated(
          itemBuilder: (context, index) => _buildItem(index),
          // ignore: prefer_const_constructors
          separatorBuilder: (context, index) => Divider(
                height: 2,
                color: Colors.black12,
              ),
          itemCount: products.length),
    );
  }

  Widget _buildItem(int index) {
    ProductItem product = products[index];
    return Padding(
      padding: cardPadding,
      child: Container(
          decoration: cardBoxStyle(),
          child: ListTile(
            leading: Image.asset(product.img),
            title: Text(product.name),
            subtitle: Text(product.price.toString()),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailsProducts(
                          product: product,
                        ))),
          )),
    );
  }
}
