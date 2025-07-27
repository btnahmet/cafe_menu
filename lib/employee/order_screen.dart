import 'package:cafe_menu/customer/screens/customer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cafe_menu/customer/constants/aoo_colors.dart';
import 'package:cafe_menu/customer/widget/dummy_category_products.dart';
import 'package:cafe_menu/customer/models/product_model.dart';
import 'package:cafe_menu/employee/staff_home_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _staffController = TextEditingController();

  String? selectedTable;
  List<ProductModel> selectedProducts = [];

  void _openMenuSelection() async {
    final result = await Navigator.push<List<ProductModel>>(
      context,
      MaterialPageRoute(
        builder: (context) => StaffMenuScreen(
          categorizedProducts: categoryProductsMap,
          initiallySelected: selectedProducts,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        selectedProducts = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text("Sipariş Oluştur"),
          centerTitle: true,
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Personel Adı:", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _staffController,
                decoration: InputDecoration(
                  hintText: "Adınızı girin",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Masa seçim ekranına gidecek
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Masa Seç",
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _openMenuSelection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Menü Seç",
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              if (selectedProducts.isNotEmpty) ...[
                const Text("Seçilen Ürünler:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedProducts.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final product = selectedProducts[index];
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          width: 160,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      product.imagePath,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close, size: 18),
                                    onPressed: () {
                                      setState(() {
                                        selectedProducts.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(product.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
                              const SizedBox(height: 4),
                              Text('${product.price.toStringAsFixed(0)}₺', style: const TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
              // Sipariş Al butonu burada olacak
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Sipariş al işlemi
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
            ],
          ),
        ),
      ),
    );
  }
}
