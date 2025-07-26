import 'package:flutter/material.dart';
import 'package:cafe_menu/customer/models/product_model.dart';

class ProductListTile extends StatelessWidget {
  final ProductModel product;

  const ProductListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(product.description,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              ],
            ),
          ),
          Text(
            '${product.price.toStringAsFixed(0)}₺',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
