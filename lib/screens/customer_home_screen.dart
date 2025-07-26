import 'package:cafe_menu/widget/dummy_category_products.dart';
import 'package:cafe_menu/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:cafe_menu/widget/dummy_categories.dart';
import 'package:cafe_menu/models/category_model.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Üstteki görsel alanı da kaydırılabilir hale geldi
            SliverToBoxAdapter(
              child: Container(
                height: height * 0.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/constants/images/images.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Grid kategorileri sliver içinde
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final CategoryModel category = dummyCategories[index];
                    return InkWell(
                      onTap: () {
                        final selectedProducts =
                            categoryProductsMap[category.name] ?? [];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductListScreen(
                              categoryTitle: category.name,
                              products: selectedProducts,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: category.imageUrl!.startsWith('http')
                                ? NetworkImage(category.imageUrl!)
                                : AssetImage(category.imageUrl!)
                                    as ImageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: dummyCategories.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
