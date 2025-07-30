import 'package:flutter/material.dart';
import 'package:cafe_menu/employee/model/order_model.dart';
import 'package:cafe_menu/employee/screens/order_edit_screen.dart';
import 'package:cafe_menu/employee/screens/order_screen.dart';
import 'package:cafe_menu/customer/constants/aoo_colors.dart';
import 'dart:ui';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({super.key, required Map categorizedProducts});

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
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            elevation: 6,
            backgroundColor: AppColors.secondary.withOpacity(0.95),
            foregroundColor: Colors.white,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            title: const Text(
              'Personel Paneli',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                letterSpacing: 0.7,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
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
                      padding: const EdgeInsets.all(18),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        final total = order.products.fold<double>(0, (sum, p) => sum + p.price);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 28),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primary.withOpacity(0.10),
                                      AppColors.secondary.withOpacity(0.13),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.10),
                                      blurRadius: 18,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                  border: Border.all(color: AppColors.primary.withOpacity(0.10)),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(32),
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width < 400 ? 14 : 28,
                                      vertical: width < 400 ? 14 : 22,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            order.staffName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: width < 400 ? 16 : 20,
                                              color: AppColors.secondary,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.table_bar, color: AppColors.primary, size: width < 400 ? 18 : 22),
                                            const SizedBox(width: 8),
                                            Text(
                                              order.tableName,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: width < 400 ? 15 : 18,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const Spacer(),
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
                                                setState(() {});
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
                                        const SizedBox(height: 8),
                                        Text(
                                          "Ürünler:",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width < 400 ? 13 : 15,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Wrap(
                                          spacing: 10,
                                          runSpacing: 10,
                                          children: order.products.map((product) => AnimatedContainer(
                                            duration: const Duration(milliseconds: 200),
                                            curve: Curves.easeInOut,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [AppColors.primary.withOpacity(0.18), AppColors.secondary.withOpacity(0.13)]),
                                              borderRadius: BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 2)),
                                              ],
                                            ),
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.fastfood, color: AppColors.secondary, size: 16),
                                                const SizedBox(width: 5),
                                                Text(product.name, style: const TextStyle(fontWeight: FontWeight.w500)),
                                              ],
                                            ),
                                          )).toList(),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Icon(Icons.access_time, size: 18, color: Colors.grey[600]),
                                            const SizedBox(width: 4),
                                            Text(
                                              _formatTime(order.createdAt),
                                              style: TextStyle(color: Colors.grey[700], fontSize: 13),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 10),
                                              width: 1.5,
                                              height: 18,
                                              color: Colors.grey[300],
                                            ),
                                            const Icon(Icons.payments, color: AppColors.primary, size: 18),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Tutar: ${total.toStringAsFixed(2)}₺',
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
                                ),
                              ),
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
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                  label: const Text(
                    "Sipariş Al",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context, 
                      MaterialPageRoute(
                          builder: (context) => const OrderScreen(allMenuItems: {},)),
                    );
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 8,
                    shadowColor: AppColors.secondary.withOpacity(0.18),
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
      return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    } else {
      return "${dateTime.day}.${dateTime.month} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    }
  }
}

// class StaffMenuScreen extends StatefulWidget {
//   final Map<String, List<ProductModel>> categorizedProducts;
//   final List<ProductModel> initiallySelected;

//   const StaffMenuScreen({super.key, required this.categorizedProducts, this.initiallySelected = const []});

//   @override
//   State<StaffMenuScreen> createState() => _StaffMenuScreenState();
// }

// class _StaffMenuScreenState extends State<StaffMenuScreen> {
//   late List<ProductModel> selectedProducts;

//   @override
//   void initState() {
//     super.initState();
//     selectedProducts = List<ProductModel>.from(widget.initiallySelected);
//   }

//   bool isSelected(ProductModel product) {
//     return selectedProducts.any((p) => p.id == product.id);
//   }

//   void toggleProduct(ProductModel product) {
//     setState(() {
//       if (isSelected(product)) {
//         selectedProducts.removeWhere((p) => p.id == product.id);
//       } else {
//         selectedProducts.add(product);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Menüden Ürün Seç"),
//           centerTitle: true,
//           backgroundColor: AppColors.secondary,
//           foregroundColor: Colors.white,
//           elevation: 4,
//         ),
//         body: ListView.builder(
//           padding: EdgeInsets.symmetric(horizontal: width < 400 ? 10 : 24, vertical: 18),
//           itemCount: widget.categorizedProducts.keys.length,
//           itemBuilder: (context, categoryIndex) {
//             String category = widget.categorizedProducts.keys.elementAt(categoryIndex);
//             List<ProductModel> products = widget.categorizedProducts[category]!;
      
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(bottom: 8, top: 8),
//                   child: Text(
//                     category,
//                     style: TextStyle(
//                       fontSize: width < 400 ? 17 : 22,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.secondary,
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                 ),
//                 Wrap(
//                   spacing: 10,
//                   runSpacing: 10,
//                   children: products.map((product) {
//                     final selected = isSelected(product);
//                     return AnimatedContainer(
//                       duration: const Duration(milliseconds: 200),
//                       curve: Curves.easeInOut,
//                       decoration: BoxDecoration(
//                         gradient: selected
//                             ? LinearGradient(colors: [AppColors.primary, AppColors.secondary.withOpacity(0.7)])
//                             : null,
//                         color: selected ? null : Colors.grey[100],
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: selected
//                             ? [BoxShadow(color: AppColors.primary.withOpacity(0.18), blurRadius: 8, offset: const Offset(0, 2))]
//                             : [],
//                         border: Border.all(
//                           color: selected ? AppColors.primary : Colors.grey[300]!,
//                           width: selected ? 2 : 1,
//                         ),
//                       ),
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(16),
//                         onTap: () => toggleProduct(product),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(
//                                 selected ? Icons.check_circle : Icons.fastfood,
//                                 color: selected ? Colors.white : AppColors.primary,
//                                 size: 20,
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 product.name,
//                                 style: TextStyle(
//                                   color: selected ? Colors.white : Colors.black87,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: width < 400 ? 13 : 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 28),
//               ],
//             );
//           },
//         ),
//         bottomNavigationBar: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: width < 400 ? 10 : 24, vertical: 12),
//             child: SizedBox(
//               width: double.infinity,
//               height: 52,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context, selectedProducts);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.secondary,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   elevation: 6,
//                   shadowColor: AppColors.secondary.withOpacity(0.18),
//                 ),
//                 child: const Text(
//                   "Onayla",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     letterSpacing: 0.5,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
