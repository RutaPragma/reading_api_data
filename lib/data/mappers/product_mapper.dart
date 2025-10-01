import 'package:lectura_datos_api/data/mappers/rating_mapper.dart';
import 'package:lectura_datos_api/data/models/product_model.dart';
import 'package:lectura_datos_api/domain/entities/entities.dart';

class ProductMapper {
  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: (map['price'] as num).toDouble(),
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: RatingMapper.fromMap(map['rating']),
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
      'rating': RatingMapper.toMap(model.rating),
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
      rating: Rating(
        rate: model.rating?.rate ?? 0,
        count: model.rating?.count ?? 0,
      ),
    );
  }
}
