import 'package:reading_api_data/data/mappers/cart/cart_product_mapper.dart';
import 'package:reading_api_data/data/models/cart/cart_model.dart';
import 'package:reading_api_data/domain/entities/cart_entities/cart.dart';

class CartMapper {
  static CartModel fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      userId: map['userId'],
      date: DateTime.parse(map['date']),
      products: (map['products'] as List)
          .map((p) => CartProductMapper.fromMap(p))
          .toList(),
    );
  }

  static Map<String, dynamic> toMap(CartModel model) {
    return {
      'id': model.id,
      'userId': model.userId,
      'date': model.date.toIso8601String(),
      'products': model.products.map(CartProductMapper.toMap).toList(),
    };
  }

  static Cart toEntity(CartModel model) {
    return Cart(
      id: model.id,
      userId: model.userId,
      date: model.date,
      products: model.products
          .map((p) => CartProductMapper.toEntity(p))
          .toList(),
    );
  }
}
