import 'package:dartz/dartz.dart';
import 'package:reading_api_data/core/network/http_client.dart';
import 'package:reading_api_data/data/data.dart';
import 'package:reading_api_data/data/datasources/products_remote_datasource.dart';
import 'package:reading_api_data/domain/domain.dart';

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
