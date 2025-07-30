import 'package:cafe_menu/customer/constants/aoo_colors.dart';
import 'package:cafe_menu/customer/models/product_model.dart';
import 'package:flutter/material.dart';

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
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Menüden Ürün Seç"),
          centerTitle: true,
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: width < 400 ? 10 : 24, vertical: 18),
          itemCount: widget.categorizedProducts.keys.length,
          itemBuilder: (context, categoryIndex) {
            String category = widget.categorizedProducts.keys.elementAt(categoryIndex);
            List<ProductModel> products = widget.categorizedProducts[category]!;
      
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: width < 400 ? 17 : 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: products.map((product) {
                    final selected = isSelected(product);
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        gradient: selected
                            ? LinearGradient(colors: [AppColors.primary, AppColors.secondary.withOpacity(0.7)])
                            : null,
                        color: selected ? null : Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: selected
                            ? [BoxShadow(color: AppColors.primary.withOpacity(0.18), blurRadius: 8, offset: const Offset(0, 2))]
                            : [],
                        border: Border.all(
                          color: selected ? AppColors.primary : Colors.grey[300]!,
                          width: selected ? 2 : 1,
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => toggleProduct(product),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                selected ? Icons.check_circle : Icons.fastfood,
                                color: selected ? Colors.white : AppColors.primary,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                product.name,
                                style: TextStyle(
                                  color: selected ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width < 400 ? 13 : 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),
              ],
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width < 400 ? 10 : 24, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, selectedProducts);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 6,
                  shadowColor: AppColors.secondary.withOpacity(0.18),
                ),
                child: const Text(
                  "Onayla",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
