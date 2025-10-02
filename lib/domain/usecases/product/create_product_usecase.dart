import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/domain/domain.dart';

class CreateProductUseCase {
  final ProductsRepository repository;

  CreateProductUseCase(this.repository);

  Future<Either<Failure, Product>> call(Map<String, dynamic> product) async {
    return await repository.createProduct(product);
  }
}
