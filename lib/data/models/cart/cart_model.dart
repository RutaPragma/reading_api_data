import 'package:reading_api_data/data/models/cart/cart_product_model.dart';

class CartModel {
  const CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  final int id;
  final int userId;
  final DateTime date;
  final List<CartProductModel> products;
}
