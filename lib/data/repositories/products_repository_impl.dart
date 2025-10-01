import 'package:dartz/dartz.dart';
import 'package:lectura_datos_api/core/network/http_client.dart';
import 'package:lectura_datos_api/data/data.dart';
import 'package:lectura_datos_api/data/datasources/products_remote_datasource.dart';
import 'package:lectura_datos_api/domain/domain.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remote;

  ProductsRepositoryImpl(this.remote);

  @override
  HttpResult<List<Product>> getProducts() async {
    final result = await remote.getProducts();
    return result.fold(
      (failure) => Left(failure),
      (models) => Right(models.map(ProductMapper.toEntity).toList()),
    );
  }
}
