import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/core/network/dio_client.dart';
import 'package:reading_api_data/data/datasources/products_remote_datasource.dart';

final productsRemoteDataSourceProvider = Provider<ProductsRemoteDataSource>((
  ref,
) {
  final httpClient = DioClient();
  return ProductsRemoteDataSourceImpl(httpClient);
});
