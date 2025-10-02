import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/network/http_client.dart';
import 'package:reading_api_data/data/data.dart';
import 'package:reading_api_data/data/datasources/cart_remote_datasource.dart';
import 'package:reading_api_data/domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remote;

  CartRepositoryImpl(this.remote);

  @override
  HttpResult<List<Cart>> getCarts() async {
    final result = await remote.getCarts();
    return result.fold((failure) => Left(failure), (models) {
      return Right(models.map(CartMapper.toEntity).toList());
    });
  }
}
