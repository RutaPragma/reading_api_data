import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/domain/entities/product.dart' show Product;

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
