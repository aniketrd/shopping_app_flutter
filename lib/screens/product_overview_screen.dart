import 'package:flutter/material.dart';

import 'package:shopping_app/widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Application'),
        ),
        body: ProductsGrid());
  }
}
