import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {super.key,
      required this.code,
      required this.price,
      required this.datetime});

  final String? code;
  final double? price;
  final String? datetime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 100,
          maxHeight: 100,
        ),
        child: Image.asset("images/pedido.png", fit: BoxFit.cover),
      ),
      title: Text(" #${code!.padLeft(5, '0')} "),
      subtitle: Text(" ${datetime}  - R\$ $price "),
      onLongPress: () {
        // Redirecionar para o carrinho
      }
    );
  }
}
