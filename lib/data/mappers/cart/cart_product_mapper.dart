import 'package:reading_api_data/data/models/cart/cart_product_model.dart';
import 'package:reading_api_data/domain/entities/cart_entities/cart_product.dart';

class CartProductMapper {
  static CartProductModel fromMap(Map<String, dynamic> map) {
    return CartProductModel(
      productId: map['productId'],
      quantity: map['quantity'],
    );
  }

  static Map<String, dynamic> toMap(CartProductModel model) {
    return {
      'productId': model.productId,
      'quantity': model.quantity,
    };
  }

  static CartProduct toEntity(CartProductModel model) {
    return CartProduct(
      productId: model.productId,
      quantity: model.quantity,
    );
  }
}
