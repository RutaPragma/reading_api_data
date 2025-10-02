import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/core/network/network.dart';
import 'package:reading_api_data/data/data.dart';

import 'package:dartz/dartz.dart';

abstract class CartRemoteDataSource {
  HttpResult<List<CartModel>> getCarts();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  CartRemoteDataSourceImpl(this.client);
  final HttpClient client;
  final String cartPath = '/carts';

  @override
  HttpResult<List<CartModel>> getCarts() async {
    final result = await client.get<List<dynamic>>(cartPath);

    return result.fold((failure) => Left(failure), (data) {
      try {
        final carts = data.map((e) => CartMapper.fromMap(e)).toList();
        return Right(carts);
      } catch (e) {
        return Left(
          UnknownFailure(
            'Error parseando usuarios <CartRemoteDataSourceImpl><getCardts>: $e',
          ),
        );
      }
    });
  }
}
