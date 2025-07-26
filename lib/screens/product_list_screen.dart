import 'package:flutter/material.dart';
import 'package:cafe_menu/models/product_model.dart';
import 'package:cafe_menu/widget/product_list_tile.dart';
import 'package:cafe_menu/constants/aoo_colors.dart'; // Renkleri buradan alabilirsin

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background, // Arka plan açık ton
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          title: Text(
            categoryTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: products.length,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, __) => const Divider(indent: 20, endIndent: 20, thickness: 0.3),
          itemBuilder: (context, index) {
            return ProductListTile(product: products[index]);
          },
        ),
      ),
    );
  }
}
