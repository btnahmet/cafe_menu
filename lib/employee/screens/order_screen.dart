import 'package:cafe_menu/employee/screens/staff_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:cafe_menu/customer/constants/aoo_colors.dart';
import 'package:cafe_menu/customer/widget/dummy_category_products.dart';
import 'package:cafe_menu/customer/models/product_model.dart';
import 'package:cafe_menu/employee/model/order_model.dart';
import 'package:cafe_menu/employee/screens/table_selection_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required Map allMenuItems});

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
        extendBody: true,
        appBar: AppBar(
          title: const Text("Sipariş Oluştur"),
          centerTitle: true,
          backgroundColor: AppColors.secondary.withOpacity(0.95),
          foregroundColor: Colors.white,
          elevation: 6,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(width < 400 ? 14 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: _staffController,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                decoration: InputDecoration(
                  labelText: "Personel Adı",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.85),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.table_bar),
                      label: const Text("Masa Seç",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        final result = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TableSelectionScreen(),
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            selectedTable = result;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color.fromARGB(255, 255, 182, 113),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.restaurant_menu),
                      label: const Text("Menü Seç",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: _openMenuSelection,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color.fromARGB(255, 255, 182, 113),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              if (selectedTable != null)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.10),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border:
                        Border.all(color: AppColors.primary.withOpacity(0.18)),
                    // backdropFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.table_bar, color: AppColors.primary, size: 22),
                      const SizedBox(width: 10),
                      Text(
                        selectedTable!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width < 400 ? 15 : 17,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              if (selectedProducts.isNotEmpty) ...[
                const Text(
                  "Seçilen Ürünler:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: selectedProducts.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final product = selectedProducts[index];
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        width: width * 0.38,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.secondary.withOpacity(0.10),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                              color: AppColors.secondary.withOpacity(0.13)),
                          // backdropFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  child: Text(
                                    product.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
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
                            Flexible(
                              child: Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${product.price.toStringAsFixed(0)}₺',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: width < 400 ? 10 : 32,
              right: width < 400 ? 10 : 32,
              bottom: 18,
              top: 8,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_rounded,
                    color: Color.fromARGB(255, 109, 7, 7)),
                label: const Text(
                  "Siparişi Kaydet",
                  style: TextStyle(
                    color: Color.fromARGB(255, 87, 4, 4),
                    fontSize: 17,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  if (_staffController.text.isNotEmpty &&
                      selectedTable != null &&
                      selectedProducts.isNotEmpty) {
                    final order = OrderModel(
                      staffName: _staffController.text.trim(),
                      tableName: selectedTable!,
                      products: List<ProductModel>.from(selectedProducts),
                    );
                    OrderRepository.addOrder(order);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Lütfen personel, masa ve menü seçiniz.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 182, 113),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  shadowColor: AppColors.secondary.withOpacity(0.25),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
