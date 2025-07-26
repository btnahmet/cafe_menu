import 'package:cafe_menu/models/product_model.dart';
import 'dummy_products.dart';

final Map<String, List<ProductModel>> categoryProductsMap = {
  'Yemekler': dummyFoodProducts,
  'Tatlılar': dummyDesserts,
  'Soğuk Kahveler': dummyColdCoffees,
  'Sıcak Kahveler': dummyHotCoffees,
  'Soğuk İçecekler': dummyColdDrinks,
  'Milkshake': dummyMilkshakes,
  'Frozen': dummyFrozen,
  'Extralar': dummyExtras,
};
