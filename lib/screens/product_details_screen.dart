import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
