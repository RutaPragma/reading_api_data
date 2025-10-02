import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/core/network/dio_client.dart';
import 'package:reading_api_data/data/datasources/cart_remote_datasource.dart';

final cartRemoteDataSourceProvider = Provider<CartRemoteDataSource>((ref) {
  final httpClient = DioClient();
  return CartRemoteDataSourceImpl(httpClient);
});
