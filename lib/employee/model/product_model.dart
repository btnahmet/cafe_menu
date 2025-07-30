import 'package:cafe_menu/customer/models/product_model.dart';

Map<String, List<ProductModel>> allMenuItems = {
  "Tatlılar": [
    ProductModel(
      id: 't1',
      name: "Sufle",
      description: "Sıcak akışkan çikolatalı kek",
      price: 35.0,
      imagePath: 'assets/images/sufle.jpg',
    ),
    ProductModel(
      id: 't2',
      name: "Cheesecake",
      description: "Frambuaz soslu klasik cheesecake",
      price: 40.0,
      imagePath: 'assets/images/cheesecake.jpg',
    ),
  ],
  "Yemekler": [
    ProductModel(
      id: 'y1',
      name: "Tavuklu Sandviç",
      description: "Izgara tavuk, yeşillik, soslu ekmek",
      price: 50.0,
      imagePath: 'assets/images/tavuklu_sandvic.jpg',
    ),
    ProductModel(
      id: 'y2',
      name: "Klasik Burger",
      description: "Köfte, cheddar, karamelize soğan",
      price: 60.0,
      imagePath: 'assets/images/klasik_burger.jpg',
    ),
  ],
  "Kahveler": [
    ProductModel(
      id: 'k1',
      name: "Latte",
      description: "Espresso ve buharda süt",
      price: 30.0,
      imagePath: 'assets/images/latte.jpg',
    ),
    ProductModel(
      id: 'k2',
      name: "Espresso",
      description: "Yoğun sert kahve",
      price: 28.0,
      imagePath: 'assets/images/espresso.jpg',
    ),
  ],
};
