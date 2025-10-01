import 'package:lectura_datos_api/data/models/product_model.dart';
import 'package:lectura_datos_api/domain/entities/product.dart';

class ProductMapper {
  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: (map['price'] as num).toDouble(),
      description: map['description'],
      category: map['category'],
      image: map['image'],
    );
  }

  static Map<String, dynamic> toMap(ProductModel model) {
    return {
      'id': model.id,
      'title': model.title,
      'price': model.price,
      'description': model.description,
      'category': model.category,
      'image': model.image,
    };
  }

  static Product toEntity(ProductModel model) {
    return Product(
      id: model.id,
      title: model.title,
      price: model.price,
      description: model.description,
      category: model.category,
      image: model.image,
    );
  }
}
