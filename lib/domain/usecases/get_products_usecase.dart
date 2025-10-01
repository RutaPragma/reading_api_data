import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/domain/domain.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
