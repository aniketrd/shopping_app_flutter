import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Product>(
      builder: (ctx, product, _) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailsScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: product.isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: product.toggleFavorite,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black54,
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => cart.addItem(
                product.id,
                product.title,
                product.price,
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
