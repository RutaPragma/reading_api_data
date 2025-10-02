import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/domain/domain.dart';

class GetProductByIdUseCase {
  final ProductsRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<Either<Failure, Product>> call(int productId) async {
    return await repository.getProductById(productId);
  }
}
