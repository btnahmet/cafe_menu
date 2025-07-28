import 'package:cafe_menu/employee/order_screen.dart';
import 'package:cafe_menu/customer/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:cafe_menu/customer/constants/aoo_colors.dart';
import 'package:cafe_menu/employee/model/order_model.dart';
import 'package:cafe_menu/employee/order_edit_screen.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({super.key});

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {

  @override
  Widget build(BuildContext context) {
    final orders = OrderRepository.getOrders();
    final width = MediaQuery.of(context).size.width;
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
            // Sipariş kartları listesi
            Expanded(
              child: orders.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Siparişler burada listelenecek.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Personel adı en üstte, soldan itibaren, responsive ve overflow yönetimiyle
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    order.staffName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width < 400 ? 15 : 18,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.table_bar, color: AppColors.primary),
                                    const SizedBox(width: 8),
                                    Text(
                                      order.tableName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width < 400 ? 15 : 18,
                                      ),
                                    ),
                                    const Spacer(),
                                    // Düzenle ve Sil butonları
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: Colors.blueGrey),
                                      tooltip: 'Düzenle',
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OrderEditScreen(orderIndex: index, order: order),
                                          ),
                                        );
                                        setState(() {}); // Düzenleme sonrası listeyi güncelle
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                                      tooltip: 'Sil',
                                      onPressed: () async {
                                        final confirm = await showDialog<bool>(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Siparişi Sil'),
                                            content: const Text('Siparişi silmek istiyor musunuz?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.of(context).pop(false),
                                                child: const Text('Hayır'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.of(context).pop(true),
                                                child: const Text('Evet'),
                                              ),
                                            ],
                                          ),
                                        );
                                        if (confirm == true) {
                                          setState(() {
                                            OrderRepository.orders.removeAt(index);
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Ürünler:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width < 400 ? 13 : 15,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: order.products.map((product) => Chip(
                                    label: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w500)),
                                    backgroundColor: AppColors.primary.withOpacity(0.1),
                                  )).toList(),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 18, color: Colors.grey[600]),
                                    const SizedBox(width: 4),
                                    Text(
                                      _formatTime(order.createdAt),
                                      style: TextStyle(color: Colors.grey[700], fontSize: 13),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Tutar: ${order.products.fold<double>(0, (sum, p) => sum + p.price).toStringAsFixed(2)}₺',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary,
                                        fontSize: width < 400 ? 13 : 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderScreen()),
                    );
                    setState(() {}); // Siparişten dönünce listeyi güncelle
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

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    if (now.difference(dateTime).inDays == 0) {
      // Bugün ise sadece saat:dakika
      return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    } else {
      // Değilse gün.ay saat:dakika
      return "${dateTime.day}.${dateTime.month} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    }
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
