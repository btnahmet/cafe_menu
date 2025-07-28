import 'package:cafe_menu/customer/models/product_model.dart';

class OrderModel {
  final String staffName;
  final String tableName;
  final List<ProductModel> products;
  final DateTime createdAt;

  OrderModel({
    required this.staffName,
    required this.tableName,
    required this.products,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}

class OrderRepository {
  static final List<OrderModel> orders = [];

  static void addOrder(OrderModel order) {
    orders.add(order);
  }

  static List<OrderModel> getOrders() {
    return orders;
  }
} 