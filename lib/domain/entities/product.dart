import 'package:reading_api_data/domain/entities/rating.dart';

class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  @override
  String toString() {
    super.toString();
    return '''

  {
    "id": $id,
    "title": "$title",
    "price": $price,
    "description": "$description",
    "category": "$category",
    "image": "$image",
    "rating": $rating
  }''';
  }
}
