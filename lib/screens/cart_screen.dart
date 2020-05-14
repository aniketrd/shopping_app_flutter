import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/widgets/cart_item.dart';
import '../providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Consumer<Cart>(
        builder: (ctx, cart, _) => Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        "\$${cart.totalAmount}",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      child: Text(
                        'ORDER NOW',
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cart.cartItems.values.toList(),
                          cart.totalAmount,
                        );
                        cart.clear();
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return CartItem(
                    id: cart.cartItems.values.toList()[i].id,
                    productId: cart.cartItems.keys.toList()[i],
                    title: cart.cartItems.values.toList()[i].title,
                    quantity: cart.cartItems.values.toList()[i].quantity,
                    price: cart.cartItems.values.toList()[i].price,
                  );
                },
                itemCount: cart.cartItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
