import 'package:dartz/dartz.dart';
import 'package:lectura_datos_api/core/error/failure.dart';
import 'package:lectura_datos_api/domain/domain.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
