// import 'package:flutter/material.dart';
// import 'package:cafe_menu/constants/aoo_colors.dart';
// import 'package:cafe_menu/constants/dummy_categories.dart';
// import 'package:cafe_menu/models/category_model.dart';

// class CustomerHomeScreen extends StatelessWidget {
//   const CustomerHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Column(
//         children: [
//           // Üst görsel alanı (senin verdiğin local path üzerinden)
//           Container(
//             height: height * 0.3,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('lib/constants/images/images.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Kategoriler grid alanı
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: dummyCategories.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//               ),
//               itemBuilder: (context, index) {
//                 final CategoryModel category = dummyCategories[index];

//                 return InkWell(
//                   onTap: () {
//                     // Kategoriye ait ürün sayfasına geçiş yapılacak
//                   },
//                   borderRadius: BorderRadius.circular(12),
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       image: DecorationImage(
//                         image: category.imageUrl!.startsWith('http')
//                             ? NetworkImage(category.imageUrl!)
//                             : AssetImage(category.imageUrl!) as ImageProvider,
//                         fit: BoxFit.cover,
//                         colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.4),
//                           BlendMode.darken,
//                         ),
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         category.name,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: width * 0.045,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cafe_menu/constants/dummy_categories.dart';
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
                        // Geçiş yapılacak yer
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: category.imageUrl!.startsWith('http')
                                ? NetworkImage(category.imageUrl!)
                                : AssetImage(category.imageUrl!) as ImageProvider,
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
