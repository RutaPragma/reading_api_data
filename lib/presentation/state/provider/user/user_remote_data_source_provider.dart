import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reading_api_data/core/network/dio_client.dart';
import 'package:reading_api_data/data/datasources/user_remote_datasource.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  final httpClient = DioClient();
  return UserRemoteDataSourceImpl(httpClient);
});
