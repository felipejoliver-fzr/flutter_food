import 'package:flutter/material.dart';
import 'package:flutter_food/utils/customStyles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/order-item.dart';
import '../../daos/order-dao.dart';
import '../../models/order.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

Widget _buildItem(Order order) {
  return Padding(
    padding: cardPadding,
    child: Container(
        decoration: cardBoxStyle(),
        child: OrderItem(
            code: order.id.toString(),
            price: order.price,
            datetime: order.datetime)),
  );
}

class _OrdersState extends State<Orders> {

  List<Order> orders = [];

  void getData() async {
    List<Order> data = await OrderDAO().readAll();
    setState(() {
      orders = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MEUS PEDIDOS'),
      ),
      body: Column(children: [
        Observer(builder: (_) {
          return Visibility(
            visible: !orders.isNotEmpty,
            child: const Text(
              "Nenhum pedido encontrado!",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
        }),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => _buildItem(orders[index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: orders.length),
        )
      ])
    );
  }
}
