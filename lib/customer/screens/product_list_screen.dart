import 'package:flutter/material.dart';
import 'package:cafe_menu/customer/models/product_model.dart';
import 'package:cafe_menu/customer/widget/product_list_tile.dart';
import 'package:cafe_menu/customer/constants/aoo_colors.dart';
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            automaticallyImplyLeading: false, // Geri tuşunu kaldırır
            elevation: 4,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(22),
              ),
            ),
            title: Text(
              categoryTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                letterSpacing: 0.6,
                color: Colors.white,
              ),
            ),
          ),
        ),

        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: products.length,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, __) =>
              const Divider(indent: 20, endIndent: 20, thickness: 0.3),
          itemBuilder: (context, index) {
            return ProductListTile(product: products[index]);
          },
        ),
      ),
    );
  }
}
