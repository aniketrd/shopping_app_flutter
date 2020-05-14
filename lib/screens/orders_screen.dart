import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:shopping_app/providers/orders.dart' show Orders;
import 'package:shopping_app/widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      drawer: AppDrawer(),
      body: Consumer<Orders>(
        builder: (ctx, orders, child) => ListView.builder(
          itemBuilder: (ctx, i) {
            return OrderItem(orders.orders[i].id);
          },
          itemCount: orders.orders.length,
        ),
      ),
    );
  }
}
