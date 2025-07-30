import 'package:cafe_menu/employee/screens/staff_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:cafe_menu/employee/model/order_model.dart';
import 'package:cafe_menu/customer/models/product_model.dart';
import 'package:cafe_menu/customer/constants/aoo_colors.dart';
import 'package:cafe_menu/employee/screens/table_selection_screen.dart';
import 'package:cafe_menu/customer/widget/dummy_category_products.dart';

class OrderEditScreen extends StatefulWidget {
  final int orderIndex;
  final OrderModel order;
  const OrderEditScreen({super.key, required this.orderIndex, required this.order});

  @override
  State<OrderEditScreen> createState() => _OrderEditScreenState();
}

class _OrderEditScreenState extends State<OrderEditScreen> {
  late TextEditingController _staffController;
  String? selectedTable;
  late List<ProductModel> selectedProducts;

  @override
  void initState() {
    super.initState();
    _staffController = TextEditingController(text: widget.order.staffName);
    selectedTable = widget.order.tableName;
    selectedProducts = List<ProductModel>.from(widget.order.products);
  }

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
          title: const Text("Siparişi Düzenle"),
          centerTitle: true,
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
        ),
        body: SingleChildScrollView(
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
              if (selectedTable != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: width * 0.01),
                  child: Text(
                    'Masa: $selectedTable',
                    style: TextStyle(
                      fontSize: width < 400 ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (selectedProducts.isNotEmpty) ...[
                Text(
                  "Seçilen Ürünler:",
                  style: TextStyle(
                    fontSize: width < 400 ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedProducts.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final product = selectedProducts[index];
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          padding: const EdgeInsets.all(8),
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
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.07,
              right: width * 0.07,
              bottom: 16,
              top: 8,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (_staffController.text.isNotEmpty && selectedTable != null && selectedProducts.isNotEmpty) {
                    final updatedOrder = OrderModel(
                      staffName: _staffController.text.trim(),
                      tableName: selectedTable!,
                      products: List<ProductModel>.from(selectedProducts),
                      createdAt: widget.order.createdAt,
                    );
                    setState(() {
                      OrderRepository.orders[widget.orderIndex] = updatedOrder;
                    });
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Lütfen personel, masa ve menü seçiniz.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "Kaydet",
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
        ),
      ),
    );
  }
} 