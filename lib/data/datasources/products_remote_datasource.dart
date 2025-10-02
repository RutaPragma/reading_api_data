import 'package:reading_api_data/core/error/failure.dart';
import 'package:reading_api_data/core/network/network.dart';
import 'package:reading_api_data/data/data.dart';

import 'package:dartz/dartz.dart';
import 'package:reading_api_data/data/mappers/product/product_mapper.dart';

abstract class ProductsRemoteDataSource {
  HttpResult<List<ProductModel>> getProducts();
  HttpResult<ProductModel> getProductById(int productId);
  HttpResult<ProductModel> createProduct(Map<String, dynamic> product);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  ProductsRemoteDataSourceImpl(this.client);
  final HttpClient client;
  final String productPath = '/products';

  @override
  HttpResult<List<ProductModel>> getProducts() async {
    final result = await client.get<List<dynamic>>(productPath);

    return result.fold((failure) => Left(failure), (data) {
      try {
        final products = data.map((e) => ProductMapper.fromMap(e)).toList();
        return Right(products);
      } catch (e) {
        return Left(
          UnknownFailure(
            'Error parseando productos <ProductsRemoteDataSourceImpl><getProducts>: $e',
          ),
        );
      }
    });
  }

  @override
  HttpResult<ProductModel> getProductById(int productId) async {
    final String path = productId == 2 ? 'prod' : 'products';

    final result = await client.get<Map<String, dynamic>>('/$path/$productId');

    return result.fold(
      (failure) => Left(
        NotFountFailure(
          'Error parseando producto <ProductsRemoteDataSourceImpl><getProductById>: ${failure.message}',
        ),
      ),
      (data) {
        try {
          final product = ProductMapper.fromMap(data);
          return Right(product);
        } catch (e) {
          return Left(
            UnknownFailure(
              'Error parseando producto <ProductsRemoteDataSourceImpl><getProductById>: $e',
            ),
          );
        }
      },
    );
  }

  @override
  HttpResult<ProductModel> createProduct(Map<String, dynamic> product) async {
    final result = await client.post<Map<String, dynamic>>(
      productPath,
      data: product,
      aditionalHeaders: {'AditionalHeader-test': 'application/json'},
    );

    return result.fold(
      (failure) => Left(
        NetworkFailure(
          'Error parseando producto <ProductsRemoteDataSourceImpl><createProduct>: ${failure.message}',
        ),
      ),
      (data) {
        try {
          final product = ProductMapper.fromMap(data);
          return Right(product);
        } catch (e) {
          return Left(
            UnknownFailure(
              'Error parseando producto <ProductsRemoteDataSourceImpl><createProduct>: $e',
            ),
          );
        }
      },
    );
  }
}
