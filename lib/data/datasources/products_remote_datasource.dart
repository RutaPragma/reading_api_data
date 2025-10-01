import 'package:lectura_datos_api/core/error/failure.dart';
import 'package:lectura_datos_api/core/network/network.dart';
import 'package:lectura_datos_api/data/data.dart';

import 'package:dartz/dartz.dart';

abstract class ProductsRemoteDataSource {
  HttpResult<List<ProductModel>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final HttpClient client;

  ProductsRemoteDataSourceImpl(this.client);

  @override
  HttpResult<List<ProductModel>> getProducts() async {
    final result = await client.get<List<dynamic>>('/products');

    return result.fold((failure) => Left(failure), (data) {
      try {
        final products = data.map((e) => ProductMapper.fromMap(e)).toList();
        return Right(products);
      } catch (e) {
        return Left(UnknownFailure('Error parseando productos: $e'));
      }
    });
  }
}
