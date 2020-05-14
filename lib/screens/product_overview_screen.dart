import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/widgets/badge.dart';

import 'package:shopping_app/widgets/products_grid.dart';

enum FilterOptions { Favorite, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  FilterOptions showFav;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Application'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (selctedValue) {
                setState(() {
                  showFav = selctedValue;
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (ctx) => [
                PopupMenuItem(
                  child: Text('Favorites Only'),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
            ),
            Consumer<Cart>(
              builder: (ctx, cart, ch) => Badge(
                child: ch,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ],
        ),
        body: ProductsGrid(showFav));
  }
}
