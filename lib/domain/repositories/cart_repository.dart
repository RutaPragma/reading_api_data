import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/domain/entities/cart_entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getCarts();
}
