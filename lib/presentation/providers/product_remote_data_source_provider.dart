import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lectura_datos_api/core/config/app_config.dart';
import 'package:lectura_datos_api/core/network/dio_client.dart';
import 'package:lectura_datos_api/data/datasources/products_remote_datasource.dart';

final productsRemoteDataSourceProvider = Provider<ProductsRemoteDataSource>((
  ref,
) {
  final httpClient = DioClient(baseUrl: AppConfig.envConfig.baseUrl);
  return ProductsRemoteDataSourceImpl(httpClient);
});
