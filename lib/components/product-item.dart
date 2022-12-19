// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_food/shared/cart-store.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.id,
      required this.name,
      required this.price,
      required this.img,
      required this.description,
      required this.quantity});

  final int id;
  final String name;
  final String description;
  final double price;
  final String img;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cartStore = context.read<CartStore>();
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
        onPressed: () {
          cartStore.removeItem(id);
        },
      ),
      subtitle: Text("R\$ $price"),
    );
  }
}
