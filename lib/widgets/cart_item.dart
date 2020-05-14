import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.quantity,
  });
  @override
  Widget build(BuildContext context) {
    double total = quantity * price;

    return Dismissible(
      key: ValueKey(id),
      background: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) =>
          Provider.of<Cart>(context, listen: false).removeItem(productId),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Container(
//            color: Theme.of(context).primaryColorLight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColorLight,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Text('\$$price'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total : ${total.toStringAsFixed(2)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
