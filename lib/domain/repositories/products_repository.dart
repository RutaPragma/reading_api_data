import 'package:dartz/dartz.dart';
import 'package:lectura_datos_api/core/error/failure.dart';
import 'package:lectura_datos_api/domain/entities/product.dart' show Product;

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
