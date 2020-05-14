import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/providers/orders.dart';

class OrderItem extends StatefulWidget {
  final String id;
  OrderItem(this.id);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).orders;
    final order = orders.firstWhere((element) => element.id == widget.id);
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Text('\$${order.amount.toStringAsFixed(2)}'),
            title: Container(
              child: Text('Order ID : ${order.id}'),
            ),
            subtitle: Text('${DateFormat.yMMMMd().format(order.dateTime)}'),
            trailing: IconButton(
              icon: isExpanded
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
//          if (isExpanded) Divider(),
          if (isExpanded)
            Container(
//              margin: EdgeInsets.all(15),
//              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey[300]),
//                  borderRadius: BorderRadius.circular(10),
              ),
              height: min(order.products.length * 20 + 100.0, 200),
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return Card(
                    color: Colors.grey[200],
                    child: ListTile(
                      title: Text('${order.products[i].title}'),
                      trailing: Text('${order.products[i].quantity} x'),
                    ),
                  );
                },
                itemCount: order.products.length,
              ),
            ),
        ],
      ),
    );
    ;
  }
}
