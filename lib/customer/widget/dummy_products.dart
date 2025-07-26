import '../models/product_model.dart';

final List<ProductModel> dummyFoodProducts = [
  ProductModel(id: 'f1', name: 'Tavuk Izgara', description: 'Pilav, köz biber, domates, salata', price: 120, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'f2', name: 'Köfte Tabağı', description: 'Izgara köfte, patates, pilav', price: 130, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'f3', name: 'Et Döner', description: 'Lavaş ekmek, domates, turşu', price: 140, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'f4', name: 'Makarna', description: 'Napoliten soslu spagetti', price: 95, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'f5', name: 'Mantı', description: 'Yoğurt ve tereyağlı sos ile', price: 100, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'f6', name: 'Pizza Dilimi', description: 'Sucuk, kaşar, zeytin', price: 110, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
];

final List<ProductModel> dummyDesserts = [
  ProductModel(id: 'd1', name: 'Fıstıklı Baklava', description: 'Kat kat yufka, antep fıstığı, tereyağı', price: 80, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'd2', name: 'Sütlaç', description: 'Fırında, üstü kızarmış', price: 60, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'd3', name: 'Künefe', description: 'Tel kadayıf, peynir, şerbet', price: 90, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'd4', name: 'Profiterol', description: 'Krema dolgulu, çikolata soslu', price: 75, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'd5', name: 'Cheesecake', description: 'Frambuaz soslu, yoğun lezzetli', price: 95, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'd6', name: 'Tiramisu', description: 'Kahveli, kremalı italyan tatlısı', price: 85, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
];

final List<ProductModel> dummyColdCoffees = [
  ProductModel(id: 'c1', name: 'Ice Latte', description: 'Soğuk süt, espresso, buz', price: 170, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'c2', name: 'Mocha Frappé', description: 'Kakao, espresso, krema', price: 180, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'c3', name: 'Cold Brew', description: '12 saat demlenmiş soğuk kahve', price: 190, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'c4', name: 'Iced Americano', description: 'Yoğun kahve, buz, su', price: 150, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'c5', name: 'Iced Caramel Latte', description: 'Karamel soslu, soğuk latte', price: 175, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'c6', name: 'Iced White Mocha', description: 'Beyaz çikolata ve süt ile', price: 185, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
];

final List<ProductModel> dummyHotCoffees = [
  ProductModel(id: 'h1', name: 'Espresso', description: 'Yoğun aromalı sert kahve', price: 50, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'h2', name: 'Cappuccino', description: 'Espresso, süt köpüğü', price: 65, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'h3', name: 'Latte', description: 'Yumuşak içimli sütlü kahve', price: 70, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'h4', name: 'Türk Kahvesi', description: 'Cezvede pişmiş geleneksel kahve', price: 45, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'h5', name: 'Americano', description: 'Espresso üzerine sıcak su', price: 60, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'h6', name: 'Macchiato', description: 'Espresso ve köpük karışımı', price: 75, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
];

final List<ProductModel> dummyColdDrinks = [
  ProductModel(id: 'cd1', name: 'Limonata', description: 'Taze limon, nane, buz', price: 45, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'cd2', name: 'Meyveli Soda', description: 'Portakal, elma veya çilek aromalı', price: 30, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'cd3', name: 'Soğuk Çay', description: 'Şeftali veya limon aromalı', price: 35, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'cd4', name: 'Ayran', description: 'Yoğurt, su ve tuz karışımı', price: 20, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'cd5', name: 'Su (500 ml)', description: 'Doğal kaynak suyu', price: 10, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'cd6', name: 'Gazoz', description: 'Meyankökü aromalı geleneksel içecek', price: 25, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
];

final List<ProductModel> dummyMilkshakes = [
  ProductModel(id: 'm1', name: 'Çilekli Milkshake', description: 'Süt, çilek dondurma, şeker şurubu', price: 75, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'm2', name: 'Kakaolu Milkshake', description: 'Süt, kakao, dondurma', price: 70, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'm3', name: 'Muzlu Milkshake', description: 'Süt, muz, şekerli dondurma', price: 75, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'm4', name: 'Vanilyalı Milkshake', description: 'Vanilya aromalı dondurma ile', price: 72, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'm5', name: 'Fıstıklı Milkshake', description: 'Antep fıstığı aromasıyla', price: 80, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'm6', name: 'Karamelli Milkshake', description: 'Karamel şurubu ile tatlandırılmış', price: 78, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
];

final List<ProductModel> dummyFrozen = [
  ProductModel(id: 'fr1', name: 'Mango Frozen', description: 'Mango püresi, buz, şeker', price: 85, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'fr2', name: 'Çilek Frozen', description: 'Çilek püresi, buz, şeker', price: 80, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'fr3', name: 'Yeşil Elma Frozen', description: 'Ferahlık veren elma aroması', price: 82, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'fr4', name: 'Limon Frozen', description: 'Ekşi taze limon ve buz', price: 79, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'fr5', name: 'Karışık Meyve Frozen', description: 'Tropikal meyve karışımı', price: 90, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'fr6', name: 'Ananas Frozen', description: 'Tatlı ve buzlu ananas içeceği', price: 84, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
];

final List<ProductModel> dummyExtras = [
  ProductModel(id: 'ex1', name: 'Ketçap + Mayonez', description: '2’li sos paketi', price: 10, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'ex2', name: 'Ranch Sos', description: 'Yoğurt ve baharat karışımı', price: 12, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'ex3', name: 'BBQ Sos', description: 'Füme aromalı sos', price: 14, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  ProductModel(id: 'ex4', name: 'Acı Sos', description: 'Baharatlı sevenlere özel', price: 10, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  // ProductModel(id: 'ex5', name: 'Kaşık Seti', description: 'Bıçak, çatal, kaşık takımı', price: 5, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
  // ProductModel(id: 'ex6', name: 'Peçete', description: 'Hijyenik kağıt peçete', price: 2, imagePath: 'lib/customer/constants/images/blueberry_mojito.jpg'),
];
