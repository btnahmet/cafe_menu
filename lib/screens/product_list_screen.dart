import 'package:cafe_menu/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:cafe_menu/models/product_model.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryTitle;
  final List<ProductModel> products;

  const ProductListScreen({
    super.key,
    required this.categoryTitle,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductListTile(product: products[index]);
        },
      ),
    );
  }
}
