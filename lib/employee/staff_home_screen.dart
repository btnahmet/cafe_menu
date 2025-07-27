import 'package:cafe_menu/employee/order_screen.dart';
import 'package:cafe_menu/customer/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:cafe_menu/customer/constants/aoo_colors.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            elevation: 4,
            backgroundColor: AppColors.secondary,
            foregroundColor: Colors.white,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            title: const Text(
              'Personel Paneli',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                letterSpacing: 0.7,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            // Buraya sipariş listesi vb. gelecek
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Siparişler burada listelenecek.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    "Sipariş Al",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StaffMenuScreen extends StatefulWidget {
  final Map<String, List<ProductModel>> categorizedProducts;
  final List<ProductModel> initiallySelected;

  const StaffMenuScreen({super.key, required this.categorizedProducts, this.initiallySelected = const []});

  @override
  State<StaffMenuScreen> createState() => _StaffMenuScreenState();
}

class _StaffMenuScreenState extends State<StaffMenuScreen> {
  late List<ProductModel> selectedProducts;

  @override
  void initState() {
    super.initState();
    selectedProducts = List<ProductModel>.from(widget.initiallySelected);
  }

  bool isSelected(ProductModel product) {
    return selectedProducts.any((p) => p.id == product.id);
  }

  void toggleProduct(ProductModel product) {
    setState(() {
      if (isSelected(product)) {
        selectedProducts.removeWhere((p) => p.id == product.id);
      } else {
        selectedProducts.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menüden Ürün Seç"),
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        elevation: 4,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, selectedProducts);
            },
            child: const Text("Onayla", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.categorizedProducts.keys.length,
        itemBuilder: (context, categoryIndex) {
          String category = widget.categorizedProducts.keys.elementAt(categoryIndex);
          List<ProductModel> products = widget.categorizedProducts[category]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: products.map((product) {
                  final selected = isSelected(product);
                  return FilterChip(
                    selected: selected,
                    label: Text(product.name, style: TextStyle(color: selected ? Colors.white : Colors.black)),
                    backgroundColor: Colors.grey[200],
                    selectedColor: AppColors.primary,
                    onSelected: (_) => toggleProduct(product),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}
