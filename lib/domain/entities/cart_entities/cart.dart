import 'package:reading_api_data/domain/entities/cart_entities/cart_product.dart';

class Cart {
  const Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  final int id;
  final int userId;
  final DateTime date;
  final List<CartProduct> products;

  @override
  String toString() {
    super.toString();
    return '''

  {
    "id": $id,
    "userId": $userId,
    "date": "$date",
    "products": $products,
  }''';
  }
}
