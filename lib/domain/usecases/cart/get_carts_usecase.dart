import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/domain/domain.dart';

class GetCartsUseCase {
  final CartRepository repository;

  GetCartsUseCase(this.repository);

  Future<Either<Failure, List<Cart>>> call() async {
    return await repository.getCarts();
  }
}
