import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.name,
      required this.price,
      required this.img,
      required this.quantity});

  final String name;
  final double price;
  final String img;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 64,
          maxHeight: 64,
        ),
        child: Image.asset("images/$img", fit: BoxFit.cover),
      ),
      title: Text("${quantity.toString()}x - $name"),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
      subtitle: Text("R\$ $price"),
    );
  }
}
