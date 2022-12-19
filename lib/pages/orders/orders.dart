import 'package:flutter/material.dart';
import 'package:flutter_food/utils/customStyles.dart';

import '../../components/order-item.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

List<OrderItem> orders = [
  OrderItem(code: 34523, datetime: DateTime.now(), price: 29),
  OrderItem(code: 34525, datetime: DateTime.now(), price: 45)
];

Widget _buildItem(int index) {
  OrderItem order = orders[index];
  return Padding(
    padding: cardPadding,
    child: Container(
        decoration: cardBoxStyle(),
        child: OrderItem(
            code: order.code, price: order.price, datetime: order.datetime)),
  );
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MEUS PEDIDOS'),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => _buildItem(index),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: orders.length),
          )
        ]));
  }
}
