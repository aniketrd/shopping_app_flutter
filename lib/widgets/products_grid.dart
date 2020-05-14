import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/product_overview_screen.dart';

import '../providers/product.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final FilterOptions showfav;

  ProductsGrid(this.showfav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showfav == FilterOptions.Favorite
        ? productsData.favoriteItems
        : productsData.items;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
